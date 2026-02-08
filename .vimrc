set nocompatible

syntax enable
colorscheme catppuccin

" Transparent background
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight Folded ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE
highlight Pmenu ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE

" Change cursor shape for different modes
let &t_SI = "\e[6 q" " Insert mode: Vertical bar (Beam)
let &t_SR = "\e[4 q" " Replace mode: Underline
let &t_EI = "\e[2 q" " Normal mode: Solid Block
let &t_ti .= "\e[2 q" " Set the cursor to a block on entry

set background=dark
set autoread
set cursorline
set hlsearch
set incsearch
set linebreak
set noswapfile
set number
set relativenumber
set smarttab
set termguicolors
set title
set wildmenu
set mouse=a
set laststatus=2
set encoding=utf-8
set backspace=indent,eol,start
set formatoptions+=j
set foldmethod=indent
set foldnestmax=3
set nofoldenable

" Add line above
nnoremap [<Space> O<Esc>j
" Add line below
nnoremap ]<Space> o<Esc>k

" Move line up
nnoremap <A-k> :m-2<CR>==
inoremap <A-k> <Esc>:m-2<CR>==gi

" Move line down
nnoremap <A-j> :m+1<CR>==
inoremap <A-j> <Esc>:m+1<CR>==gi

" Move visual selection
vnoremap <A-k> :m '<-2<CR>gv=gv
vnoremap <A-j> :m '>+1<CR>gv=gv


