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
set hidden
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
set clipboard=unnamedplus

" Netrw
let g:netrw_banner = 0
let g:netrw_keepdir = 0
let g:netrw_winsize = 30
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
hi! link netrwMarkFile Search

" Disable arrow keys in normal mode
nnoremap <Up>    <NOP>
nnoremap <Down>  <NOP>
nnoremap <Left>  <NOP>
nnoremap <Right> <NOP>

" Redo
nnoremap U <C-r>

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

" Jump between windows
nnoremap <S-H> <C-w>h
nnoremap <S-J> <C-w>j
nnoremap <S-K> <C-w>k
nnoremap <S-L> <C-w>l

" Buffer navigation with Shift+Alt+Left/Right
nnoremap <S-A-Left> :bprevious<CR>
nnoremap <S-A-Right> :bnext<CR>
inoremap <S-A-Left> <Esc>:bprevious<CR>
inoremap <S-A-Right> <Esc>:bnext<CR>

" Toggle wrap
nnoremap \w :set wrap! wrap?<CR>

" Typos
command! Q  q
command! W  w
command! Wq wq
command! WQ wq

" Close all buffers
command! Bda %bd

" Close all other buffers
command! Bdo let cur = bufnr('%') | silent! execute 'bufdo if bufnr() != ' . cur . ' | bd | endif'

" Buffer tabline
function! BufferTabline()
  let s = ''
  for i in range(1, bufnr('$'))
    if bufexists(i) && buflisted(i)
      let s .= (i == bufnr('%') ? '%#TabLineSel#' : '%#TabLine#')
      let s .= ' ' . i . ' '
      let name = bufname(i)
      let s .= empty(name) ? '[No Name]' : fnamemodify(name, ':t')
      let s .= (getbufvar(i, '&modified') ? ' ●' : '')
      let s .= ' '
    endif
  endfor
  let s .= '%#TabLineFill#'
  return s
endfunction

set showtabline=2
set tabline=%!BufferTabline()
