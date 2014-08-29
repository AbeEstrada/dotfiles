" Make vim more useful
set nocompatible

" Enable syntax highlighting
syntax on
set t_Co=256
set background=dark

let mapleader="," " Change mapleader
set encoding=utf8 nobomb " Encoding UT8
set number " Line numbers
set showcmd " Show command in bottom bar
set showmode " Show current mode
set ruler " Show cursor position
set mouse=a " Enable mouse in all modes
set tabstop=4 " Number of visual spaces per TAB
set softtabstop=4 " Number of spaces in tab when editing
set expandtab " Tabs are spaces
set autoread " Read when a file is changes
set backspace=eol,start,indent " Make backspace useful

" Enable filetype plugins
filetype plugin on 
filetype indent on

" Turn backup off
set nobackup
set nowb
set noswapfile

set wildchar=<TAB> " Character for CLI expansion (TAB-completion)
set wildmenu " Hitting TAB in command mode will show possible completions above command line
set lazyredraw " Redraw only when we need to
set showmatch " Highlight matching [{()}]

set magic " Enable extendend regexes
set incsearch " Highlight dynamically as patter is typed
set hlsearch " Highlight searches
set ignorecase " Ignore case of searches
set smartcase " Ignore 'ignorecase' if search pattern contains uppercase characters

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" Paste toggle (,p)
set pastetoggle=<leader>p
map <leader>p :set invpaste paste?<CR>

" Fix page up and down
map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>

