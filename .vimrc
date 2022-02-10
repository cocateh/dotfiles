set nocompatible
syntax on
filetype indent plugin on

"call plug#begin('~/.vim/plugged')
"
"Plug 'sheerun/vim-polyglot'
"Plug 'phanviet/vim-monokai-pro'
"Plug 'ajh17/VimCompletesMe'
"Plug 'laxhh/vim-gruber-darker'

"call plug#end()

"colorscheme gruber-darker

if has("gui_running")
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
endif

set incsearch
"set termguicolors
set hlsearch
set ruler
set ai
set wildmenu
set tabstop=4
set shiftwidth=4
set expandtab
" set relativenumber
set number
set path+=**
set backspace=indent,eol,start
set mouse=a
set colorcolumn=80
set guicursor=
set laststatus=0
