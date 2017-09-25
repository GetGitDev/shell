set nocompatible
filetype off

" (make sure that git is installed prior to vim config)
" --------------------------------------------------------------------------------
" Step 1:  Configure VUNDLE - https://github.com/VundleVim/Vundle.vim
"		$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" set the runtime path to include Vundle and initialize

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive' 
Plugin 'lawrencium'
Plugin 'joshdick/onedark.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'jistr/vim-nerdtree-tabs'


" All Plugins:
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

" Help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Non-Plugin stuff after this line
" -----------------------------------------------------------------------------
let python_highlight_all=1
syntax on



" -----------------------------------------------------------------------------
" Step 2 - Setup status bar plugins
" Airline (status bar) config 

let g:airline_section_c = '%{strftime("%c")} - %{getcwd()} %T'
"let g:airline_section_c = '%B'
"let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='onedark'
let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts=0
  if !exists('g:airline_symbols')
  	      let g:airline_symbols = {}
  	        endif
  	        
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒 '
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" Powerline symbols
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Color toggle
let g:onedark_termcolors=256
" ---------------------------------------------------
" The rest of the VIM config
set laststatus=2  " airline status window
set showmode      " show what mode vim is in
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set copyindent    " copy the previous indentation on
set autoindent    " always set autoindenting on
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000                " remember more commands and search history
set undolevels=1000             " use lots of levels of undo
" Code folding bits
set foldmethod=indent			" allow collapsing of methods/functions/classes
set foldlevel=99				" number of levels allowed to fold in
let g:SimpylFold_docstring_preview=1
" Enable folding with the spacebar
nnoremap <space> za
" Map the arrow keys to nav a doc
map <D-A-RIGHT> <C-w>l
map <D-A-LEFT> <C-w>h
map <D-A-DOWN> <C-w><C-w>
map <D-A-UP> <C-w>W
" Map open file tree to ctrl+o
map <C-o> :NERDTreeToggle<CR>
" Let vim know how to read pep8 indents
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
" Step 3 select theme for vim color
"	git clone git@github.com:joshdick/onedark.vim.git
colorscheme onedark
