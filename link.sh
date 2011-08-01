#/bin/sh
# create a symlink to home directory for all files in config
find config -mindepth 1 -maxdepth 1 -printf "%f\n" | xargs -I QQ ln -s `pwd`/config/QQ ~/QQ
