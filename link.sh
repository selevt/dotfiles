#/bin/bash

# Creates a symlink for every file and directory that ends with .symlink
# Existing files will be moved into the 'TARGET_BACKUPS' directory.
BASEDIR=$(dirname $0)
TARGET=~
# script changes to BASEDIR, so backups reside in that folder
TARGET_BACKUPS=./backups

function main() {
  # make sure to be in the right working directory
  cd $BASEDIR
  tree -afi | grep ".symlink$" | sed 's:./config/::' | sed 's:.symlink::' | create_symlinks
}

function create_symlinks() {
  cat - | while read LINE
  do
      create_symlink ${LINE}
  done
}

function create_symlink() {
  link_target=$TARGET/$1
  parent_dir=`dirname $link_target`

  # create parent dir in case it doesn't exist
  if [ ! -d $parent_dir ]; then
      echo "Parent of dotfile doesn't exist. Creating: $parent_dir"
      mkdir -p $parent_dir
  fi

  # move file to backup directory when it exists
  backup $link_target

  ln -s $(pwd)/config/$1.symlink $link_target
}

function backup() {
  # copy file into backup directory with appended timestamp
  if [ -e $1 ]; then
      if [ ! -d $TARGET_BACKUPS ];  then
          mkdir $TARGET_BACKUPS
      fi

      target_filename=`basename $1`.`date +%s`
      echo "File '$1' already exists. Moving to backup directory: '$target_filename'"

      mv $1 $TARGET_BACKUPS/$target_filename
  fi
}

main
