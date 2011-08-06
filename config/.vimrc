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
au BufNewFile,BufRead .vim/vimrc/* set filetype=vim

source $HOME/.vim/vimrc/colors
source $HOME/.vim/vimrc/basic

" edit/reload of vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" (windows) paste
map <silent> <leader>p i<F2><C-r>+<F2><esc>

set pastetoggle=<F2>

" tab -> bracket pairs
nnoremap <tab> %
vnoremap <tab> %

" post sudo
cmap w!! w !sudo tee % >/dev/null

" navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


source $HOME/.vim/vimrc/latex

"""" nerdtree
let NERDTreeIgnore=['\.aux$', '\.bbl$', '\.blg$', '\.lof$', '\.lol$', '\.out$', '\.toc$', '\.lot$', '\.tdo$', '\.pdf$', '\.idx$', '\.nlo$', '\.brf$', '\.ilg$', '\.ind$', '\.docx$']
map <F3> :NERDTreeToggle<CR>

" map öö to esc in input mode
imap öö <esc>


""""" leader functions
nmap <leader>l :set list!<CR>
set listchars=tab:¿\ ,eol:¬,trail:·
nmap <leader>r :set relativenumber<CR>
nmap <leader>m :q<CR><C-w>jf{lyt,:q<CR><C-w>lp


""""" macros
" macro for RST-style headers
let @h = "yypVr"
