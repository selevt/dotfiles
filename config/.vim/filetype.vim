" vimrc syntax highlight for specific files
au BufNewFile,BufRead */.vim/vimrc/* set filetype=vim
" shell syntax for specific bash files
au BufNewFile,BufRead */dotfiles/sh/* set filetype=sh

" gradle build files
au BufNewFile,BufRead *.gradle setf groovy

" format golang files on save
autocmd FileType go autocmd BufWritePre <buffer> Fmt
