# Dotfiles

My dotfiles and scripts

## Dependencies
- [starship](https://starship.rs/)

## Usage

grab included submodules::

    git submodule update --init --recursive

from inside the dotfiles directory::

    ./link.sh

this will create symlinks to the home directory for every file and directory inside the config
directory that ends with '.symlink'.

Update all submodules::

    git submodule foreach git pull origin master

