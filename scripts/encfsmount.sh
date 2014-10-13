#!/bin/bash

# This script mounts a encfs with the password being retrieved from KWallet.
# If the password is not yet present in KWallet it will be prompted the first
# time the script is executed.

APP_NAME="encfs mounting"
PWD_FOLDER="Passwords"
PWD_KEY="encfs.dropbox"

# Folder in which the encrypted files are stored
ENC_DIR=~/Dropbox/crypt
# Folder to be mounted with the decrypted files
DEC_DIR=~/Hive


# Default Wallet can also be retrieved with:
# kreadconfig --file kwalletrc --group Wallet --key "Default Wallet"
wallet=$(qdbus org.kde.kwalletd /modules/kwalletd org.kde.KWallet.localWallet)
handle=$(qdbus org.kde.kwalletd /modules/kwalletd org.kde.KWallet.open "$wallet" 0 "$APP_NAME")

if [ $handle -lt 0 ]; then
    kdialog --error "Wallet could not be opened"
    exit 3
fi

hasKey=$(qdbus org.kde.kwalletd /modules/kwalletd org.kde.KWallet.hasEntry "$handle" "$PWD_FOLDER" "$PWD_KEY" "$APP_NAME")

if ! $hasKey; then
    pwd=$(kdialog --password "Password for $PWD_KEY")
    qdbus org.kde.kwalletd /modules/kwalletd org.kde.KWallet.writePassword "$handle" "$PWD_FOLDER" "$PWD_KEY" "$pwd" "$APP_NAME"
else
    pwd=$(qdbus org.kde.kwalletd /modules/kwalletd org.kde.KWallet.readPassword "$handle" "$PWD_FOLDER" "$PWD_KEY" "$APP_NAME")
fi

mntmsg=$(echo $pwd | encfs -S "$ENC_DIR" "$DEC_DIR" 2>&1)
mntres=$?

if [ $mntres -ne 0 ]; then
    kdialog --error "$mntmsg"
    exit 4
fi
