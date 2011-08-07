" .vimrc file

set nocompatible

" pathogen for bundles
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" essential
let mapleader=","   " set leader key to ','
set modelines=0     " turn off modelines (text in files to override settings)

" vimrc syntax highlight for specific files
au BufNewFile,BufRead */.vim/vimrc/* set filetype=vim
" shell syntax for specific bash files
au BufNewFile,BufRead */dotfiles/sh/* set filetype=sh

source $HOME/.vim/vimrc/ui
source $HOME/.vim/vimrc/basic

" tab key moves between matching bracket pairs in normal mode
nnoremap <tab> %
vnoremap <tab> %

source $HOME/.vim/vimrc/keys
source $HOME/.vim/vimrc/latex

"""" nerdtree
let NERDTreeIgnore=['\.aux$', '\.bbl$', '\.blg$', '\.lof$', '\.lol$', '\.out$', '\.toc$', '\.lot$', '\.tdo$', '\.pdf$', '\.idx$', '\.nlo$', '\.brf$', '\.ilg$', '\.ind$', '\.docx$']
map <F3> :NERDTreeToggle<CR>

