" .vimrc file

" pathogen for bundles
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" essential
let mapleader=","
set nocompatible
set modelines=0

" vimrc syntax highlight for specific files
au BufNewFile,BufRead */.vim/vimrc/* set filetype=vim

source $HOME/.vim/vimrc/colors
source $HOME/.vim/vimrc/basic

" tab -> bracket pairs
nnoremap <tab> %
vnoremap <tab> %

source $HOME/.vim/vimrc/keys
source $HOME/.vim/vimrc/latex

"""" nerdtree
let NERDTreeIgnore=['\.aux$', '\.bbl$', '\.blg$', '\.lof$', '\.lol$', '\.out$', '\.toc$', '\.lot$', '\.tdo$', '\.pdf$', '\.idx$', '\.nlo$', '\.brf$', '\.ilg$', '\.ind$', '\.docx$']
map <F3> :NERDTreeToggle<CR>

