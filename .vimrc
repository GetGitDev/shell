"  ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗     ██╗    ██████╗ 
"  ██║   ██║██║████╗ ████║██╔══██╗██╔════╝    ███║   ██╔═████╗
"  ██║   ██║██║██╔████╔██║██████╔╝██║         ╚██║   ██║██╔██║
"  ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║          ██║   ████╔╝██║
"██╗╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗     ██║██╗╚██████╔╝
"╚═╝ ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝     ╚═╝╚═╝ ╚═════╝ 
" -----------------------------------------------------------------------------
set nocompatible
filetype off
" (make sure that git is installed prior to vim config)
" Fonts - git $ clone https://github.com/powerline/fonts.git --depth=1
" -----------------------------------------------------------------------------
" Step 1 - Configure Vundle
" 	    	$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" -----------------------------------------------------------------------------
" Step 1.1 - Set runtime path to include Vundle and initialize
" ---------------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim " location of vundle plugin
call vundle#begin() " init Vundle
" Vundle managed plugins (:PluginInstall) 
Plugin 'VundleVim/Vundle.vim' 
Plugin 'vim-airline/vim-airline' " Statusbar plugin
Plugin 'vim-airline/vim-airline-themes' " Statusbar plugin's themes
Plugin 'tpope/vim-fugitive'  " Git wrapper for Vim
Plugin 'joshdick/onedark.vim' " Pastel/dark theme for Vim
Plugin 'tmhedberg/SimpylFold' " Code folding with hotkeys
Plugin 'vim-scripts/indentpython.vim' " Indentation script for python
Plugin 'vim-syntastic/syntastic' " Syntax checking plugin
Plugin 'scrooloose/nerdtree' " Directory tree plugin
Plugin 'sheerun/vim-polyglot' " Languague pack plugin 
Plugin 'jistr/vim-nerdtree-tabs' " Directory tree tab addon plugin
Plugin 'JamshedVesuna/vim-markdown-preview' " Markdown preview plugin
" ---------------------------------------------------
" Step 1.2 - End of the plugins declaration
call vundle#end()            " required
filetype plugin indent on    " required
" ---------------------------------------------------
" Vundle help - 
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" ---------------------------------------------------
" see :h vundle for more details or wiki for FAQ
" -----------------------------------------------------------------------------
" Step 2 - All plugin and VIM settings
" -----------------------------------------------------------------------------
syntax on
let python_highlight_all=1
" ---------------------------------------------------
" Step 2.1 - Status bar plugins/Airline Config
" Airline (status bar) config 
" ---------------------------------------------------
let g:airline_section_c = '%{strftime("%c")} - %{getcwd()} %T'
let g:airline_section_c = '%B'
let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='onedark'
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif       
" Color toggle
let g:onedark_termcolors=256
" -----------------------------------------------------------------------------
" Step 3 - The rest of the VIM settings config
" -----------------------------------------------------------------------------
set laststatus=2  " airline status window
set showmode      " show what mode vim is in
"set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on
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
" ---------------------------------------------------
" Step 3.1 - Syntaxtic settings
" ---------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_mode_map = { 'mode': 'active' }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_python_checkers = ['python', 'pylint'] 
" ---------------------------------------------------
" Step 3.2 - Code folding settings
" ---------------------------------------------------
set foldmethod=indent			" allow collapsing of methods/functions/classes
set foldlevel=99				" number of levels allowed to fold in
let g:SimpylFold_docstring_preview=1
" Enable code-folding with the spacebar
nnoremap <space> za
" ---------------------------------------------------
" Step 3.3 - Map the arrow keys to navigate a doc
" ---------------------------------------------------
map <D-A-RIGHT> <C-w>l
map <D-A-LEFT> <C-w>h
map <D-A-DOWN> <C-w><C-w>
map <D-A-UP> <C-w>W
" ---------------------------------------------------
" Step 3.4 Map open file nerd-tree hotkey to ctrl+o
" ---------------------------------------------------
map <C-o> :NERDTreeToggle<CR>
" ---------------------------------------------------
" Step 3.5 - Let vim know how to read pep8 indents
" ---------------------------------------------------
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
" Step 3.6 - Set line length for MarkDown
au BufRead,BufNewFile *.md setlocal textwidth=100
"  -----------------------------------------------------------------------------
" Step 4 - Select theme for vim color
"	        $ git clone git@github.com:joshdick/onedark.vim.git
"  -----------------------------------------------------------------------------
colorscheme onedark
