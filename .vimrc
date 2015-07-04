set nocompatible " Use vim, no vi defaults

" pathogen.vim
execute pathogen#infect()
filetype plugin indent on

" Syntax highlighting
set t_Co=256
set background=dark
set guifont=Inconsolata-g\ for\ Powerline:h13
syntax on
colorscheme molokai
if has("gui_macvim")
  set transparency=3
  set go-=T
  "macmenu File.New\ Tab key=<nop>
  "map <D-t> :CtrlP<CR>
endif
if (exists('+colorcolumn'))
  set colorcolumn=80
  highlight ColorColumn ctermbg=232
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
set cursorline " Highlight current line
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
set magic
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

autocmd FileType text       setlocal wrap textwidth=80
autocmd FileType markdown   setlocal wrap
"autocmd FileType php        setlocal shiftwidth=4 tabstop=4
"autocmd FileType python     setlocal shiftwidth=4 tabstop=4

" Close HTML tags with <//
iabbrev <// </<C-X><C-O>

" CtrlP
let g:ctrlp_use_caching = 0

" NERDCommenter mappings
if has("gui_macvim") && has("gui_running")
  map  <D-/> <plug>NERDCommenterToggle<CR>
  imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i
else
  map <leader>/ <plug>NERDCommenterToggle<CR>
endif

" vim-indent-guies
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'drjova'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_extensions = ['branch', 'ctrlp', 'hunks']

" vim-jsx
let g:jsx_ext_required = 0

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_default_key_mappings = 1

" php.vim
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

" Rename current file, thanks Gary Bernhardt via Ben Orenstein
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>r :call RenameFile()<cr>
