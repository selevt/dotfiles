" .vimrc file

" pathogen for bundles
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" essential
let mapleader=","
set nocompatible
set modelines=0

" display
colorscheme molokai
"let g:molokai_original=1
set wrap
if version >= 703
    set colorcolumn=105
endif

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


"""" LaTeX 
" necessary for latex in windows
set shellslash
" empty tex files should be tex instead of plaintext
let g:tex_flavor='latex'
let g:Tex_MultipleCompileFormats = 'dvi,pdf'
let g:Tex_DefaultTargetFormat = 'pdf'
"bib
let g:Tex_BibtexFlavor = 'bibtex'
let g:Tex_CompileRule_bib = g:Tex_BibtexFlavor . ' $*'
"" custom cmd mappings
" acronyms
let g:Tex_Com_acro = "\\acro{<++>}{<++>}<++>"

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

