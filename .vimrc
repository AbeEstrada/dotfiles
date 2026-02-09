set nocompatible

syntax enable
colorscheme tokyonight

augroup fix_cursorline " Remove tokyonight underline
  autocmd!
  autocmd ColorScheme * hi CursorLine   cterm=NONE term=NONE
  autocmd ColorScheme * hi CursorLineNr cterm=NONE term=NONE
augroup END

" Change cursor shape for different modes
let &t_SI = "\e[6 q" " Insert mode: Vertical bar (Beam)
let &t_SR = "\e[4 q" " Replace mode: Underline
let &t_EI = "\e[2 q" " Normal mode: Solid Block
let &t_ti .= "\e[2 q" " Set the cursor to a block on entry

set background=dark
set autoread
set cursorline
set expandtab
set hidden
set incsearch
set ignorecase
set linebreak
set noswapfile
set number
set relativenumber
set smarttab
set showmode
set termguicolors
set title
set wildmenu
set mouse=a
set tabstop=2
set shiftwidth=2
set laststatus=2
set encoding=utf-8
set backspace=indent,eol,start
set formatoptions+=j
set foldmethod=indent
set foldnestmax=3
set nofoldenable
set clipboard=unnamedplus,unnamed

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

" Statusline
function! GetCurrentMode()
  let l:mode = mode()
  if l:mode ==# 'n'  | return 'NORMAL' | endif
  if l:mode ==# 'i'  | return 'INSERT' | endif
  if l:mode ==# 'v'  | return 'VISUAL' | endif
  if l:mode ==# 'V'  | return 'V-LINE' | endif
  if l:mode ==# 'c'  | return 'COMMAND' | endif
  if l:mode ==# 'R'  | return 'REPLACE' | endif
  if l:mode ==# "\<C-v>" | return 'V-BLOCK' | endif
  return l:mode
endfunction

function! GetPercent()
    let l:curr = line('.')
    let l:tot  = line('$')
    return (l:curr * 100) / l:tot
endfunction

let g:git_branch_cache = {}

function! GetGitBranch()
  let l:dir = fnamemodify(expand('%:p'), ':h')
  if l:dir == '' | return '' | endif

  if has_key(g:git_branch_cache, l:dir)
    return g:git_branch_cache[l:dir]
  endif

  let l:branch = system('git -C ' . fnameescape(l:dir) . ' rev-parse --abbrev-ref HEAD 2>/dev/null | head -n1')
  if v:shell_error != 0
    let g:git_branch_cache[l:dir] = ''
    return ''
  endif

  let l:branch = trim(l:branch)
  let g:git_branch_cache[l:dir] = (l:branch != '' ? '[' . l:branch . '] ' : '')
  return g:git_branch_cache[l:dir]
endfunction

autocmd BufEnter,BufWritePost,FocusGained * unlet! g:git_branch_cache[fnamemodify(expand('%:p'), ':h')]

set statusline=
set statusline+=\ [%{GetCurrentMode()}]
set statusline+=\ %f                        " File path
set statusline+=\ %{GetGitBranch()}
set statusline+=\ %m                        " Modified flag [+]
set statusline+=\ %=                        " Switch to right side
set statusline+=\ %{(&fenc!=''?&fenc:&enc)} " Encoding (utf-8)
set statusline+=\ %{&ff}                    " Line break type (unix/dos)
set statusline+=\ [%Y]                      " File type
set statusline+=\ %{GetPercent()}\%%
set statusline+=\ %l:%c\ %L                 " Line:Column Total Lines

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

hi TabLine     guibg=NONE guifg=#828bb8 gui=NONE cterm=NONE
hi TabLineFill guibg=NONE cterm=NONE term=NONE

set showtabline=2
set tabline=%!BufferTabline()

