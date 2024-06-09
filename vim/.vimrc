syntax on
set number
set modelines=0

set path+=**
set wildmenu
set nocompatible
filetype plugin on

set number relativenumber

" Custom keymaps
nnoremap <A-right> :tabnext<CR>
nnoremap <A-left> :tabprevious<CR>
nnoremap T :tabnew<CR>
" Move lines up/down
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
inoremap <c-j> <Esc>:m .+1<CR>==gi
inoremap <c-k> <Esc>:m .-2<CR>==gi
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

" Show file stats
set ruler

set encoding=utf-8
" Spaces and whatnots
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd
" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
let g:user_emmet_leader_key=','

" call plug#begin('~/.vim/plugged')
" Plug 'mattn/emmet-vim'
" call plug#end()

" NerdTree
call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'mattn/emmet-vim'
call plug#end()

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

set laststatus=2
set statusline=
set statusline+=%2*
set statusline+=%{StatuslineMode()}
set statusline+=%1*
set statusline+=\ 
set statusline+=<
set statusline+=<
set statusline+=\ 
set statusline+=%f
set statusline+=\ 
set statusline+=>
set statusline+=>
set statusline+=%=
set statusline+=%m
set statusline+=%h
set statusline+=%r
set statusline+=\ 
set statusline+=%3*
set statusline+=%1*
set statusline+=%4*
set statusline+=%F
set statusline+=:
set statusline+=:
set statusline+=%5*
set statusline+=%l
set statusline+=/
set statusline+=%L
set statusline+=%1*
set statusline+=|
set statusline+=%y
set statusline+=%2*
set statusline+=%2*
set statusline+=%2*
set statusline+=%2*
set statusline+=%2*
set statusline+=%2*
set statusline+=%2*
set statusline+=%2*
set statusline+=%2*
set statusline+=%2*
set statusline+=%2*
set statusline+=%2*
hi User2 ctermbg=lightgreen ctermfg=black guibg=lightgreen guifg=black
hi User1 ctermbg=black ctermfg=white guibg=black guifg=white
hi User3 ctermbg=black ctermfg=lightblue guibg=black guifg=lightblue
hi User4 ctermbg=black ctermfg=lightgreen guibg=black guifg=lightgreen
hi User5 ctermbg=black ctermfg=magenta guibg=black guifg=magenta

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    hi User2 ctermbg=lightgreen ctermfg=black guibg=lightgreen guifg=black
    return "NORMAL"
  elseif l:mode==?"v"
    hi User2 ctermbg=lightblue ctermfg=black guibg=lightgreen guifg=black
    return "VISUAL"
  elseif l:mode==#"i"
    hi User2 ctermbg=yellow ctermfg=black guibg=lightgreen guifg=black
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT"
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL"
  endif
endfunction

highlight lineNr term=bold cterm=NONE ctermbg=none  ctermfg=none gui=bold

set cursorline

highlight CursorLine term=bold cterm=NONE ctermbg=238 ctermfg=none gui=bold

highlight CursorLineNr term=bold cterm=none ctermbg=238  ctermfg=yellow gui=bold

highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

