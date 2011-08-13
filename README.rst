Dotfiles
========

My dotfiles and scripts

Usage
-----
grab included submodules::

    git submodule update --init

from inside the dotfiles directory::

    ./link.sh

this will create symlinks to home directory for every file inside the config
directory

Content
-------
* VIM config and plugins:
 * color: molokai
 * nerd commenter (Version: git-linked)
 * nerd tree (Version: git-linked)
 * vim-latex (Version: vim-latex-1.8.23-20100129-r1104)
 * vst (vim restructured text) (Version: 1.4)
 * zencoding-vim (Version: git-linked)
* shell rc files
 * .bashrc and .zshrc with common settings (sh/env, sh/alias)
 * sh/zshrc_grml base zshrc file from grml
  * http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc (Version: 05.08.2011)

TODO
----
* create script to remove/backup old files in ~
* VIM
 * document everything
 * add: snipmate, command-t, (matchit, matchit_python)?
 * handle filetype specific indentation
* scripts
 * add virtualenvwrapper?
