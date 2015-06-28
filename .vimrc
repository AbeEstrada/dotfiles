set nocompatible " Use vim, no vi defaults

" Syntax highlighting
set t_Co=256
set background=dark
set guifont=Inconsolata-g:h13
syntax on
colorscheme molokai
if has("gui_macvim")
  set transparency=4
endif
if (exists('+colorcolumn'))
  set colorcolumn=80
  highlight ColorColumn ctermbg=9
endif

" Local directories
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo

" Set
set autoindent " Copy indent from last line when starting a new line
set autoread " Automatically reload  externally changed file
set backspace=indent,eol,start
set clipboard=unnamed " Use the OS clipboard by default (on versions compiled with `+clipboard`)
"set cursorline " Highlight current line
set encoding=utf-8 nobomb " BOM often causes trouble
set esckeys " Allow cursor keys in insert mode
set expandtab " Expand tabs to spaces
set hidden " When a buffer is brought to foreground, remember undo history and marks
set history=1000 " Increase history from 20 default to 1000
set hlsearch " Highlight matches
set ignorecase " Ignore case of searches
set incsearch " Highlight dynamically as pattern is typed
set laststatus=2 " Always show status line
set lazyredraw " Don't redraw when we don't have to
set listchars=tab:▸\ ,trail:~,eol:¬,nbsp:·
set magic " Enable extended regexes
set mouse=a " Enable mouse in all modes
set noerrorbells " Disable error bells
set nowrap " Do not wrap lines
set number " Enable line numbers
set report=0 " Show all changes
set ruler " Show the cursor position
set scrolloff=3 " Start scrolling three lines before horizontal border of the window
set shiftwidth=2 " The # of spaces for indenting
set shiftround " Use multiple of shiftwidth when indenting with '<' and '>'
set shortmess=atI " Don't show the intro message when starting vim
set showtabline=2 " Always show the tab bar
set sidescrolloff=3 " Start scrolling three columns before vertical border of window
set smartcase " Ignore 'ignorecase' if search pattern contains uppercase characters
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces
set softtabstop=2 " Tab key results in 2 spaces
set splitbelow " New window goes below
set splitright " New windows goes right
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
set title " Show the filename in the window titlebar
set ttyfast " Send more characters at a given time
set ttymouse=xterm2 " Set mouse type to xterm
set undofile " Persistent Undo
set visualbell " Use visual bell instead of audible bell (annnnnoying)
set wildchar=<TAB> " Character for CLI expansion (TAB-completion)
set wildignore+=.DS_Store,bundle.js
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.webm,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/doc/*,*/source_maps/*,*/dist/*
set wildmenu " Hitting TAB in command mode will show possible completions above command line
set wildmode=list:longest " Complete only until point of ambiguity
set wrapscan " Searches wrap around end of file

" NERDCommenter mappings
if has("gui_macvim") && has("gui_running")
  map  <D-/> <plug>NERDCommenterToggle<CR>
  imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i
else
  map <leader>/ <plug>NERDCommenterToggle<CR>
endif

" pathogen.vim
execute pathogen#infect()
filetype plugin indent on

" vim-indent-guies
let g:indent_guides_enable_on_vim_startup = 1

" vim-jsx
let g:jsx_ext_required = 0

