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

" useful (some are usually default)
set encoding=utf-8
set scrolloff=3             " keep lines on top/bottom
set autoindent
set showmode                " show current mode
set showcmd                 " show partially typed cmds
set ruler                   " always show line and column
set hidden                  " hide buffer instead of closing
set wildmenu                " show matching auto completion cmds
set wildmode=list:longest   " only complete to longest match
set visualbell              " disable fucking annoying beeping
set cursorline              " highlight current line
set ttyfast                 " redrawing stuff
set backspace=2             " allow backspacing over lines
set laststatus=2            " always show status line
set number
if version >= 703
  set relativenumber
endif

" edit/reload of vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" (windows) paste
map <silent> <leader>p i<F2><C-r>+<F2><esc>

set pastetoggle=<F2>


syntax on

filetype plugin indent on

" tab behaviour
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" search options
nnoremap / /\v
vnoremap / /\v
set ignorecase
set gdefault                " use /g option by default for :s
set incsearch               " show hl increments when typing
set showmatch
set hlsearch
nmap <silent> <leader>/ :nohlsearch<CR>

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

