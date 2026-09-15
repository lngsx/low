" Drop legacy vi compatibility (this is the most important one)
set nocompatible

" Leader key: <Space> instead of the default backslash
" (must be set before plugins load and before any <leader> mappings)
let mapleader = "\<Space>"

" Plugins (vim-plug)
call plug#begin()
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'ap/vim-buftabline'
call plug#end()

" fzf: fuzzy file finder
nnoremap <C-p> :Files<CR>

" Enable syntax highlighting
syntax on

" Enable filetype detection and auto-indentation
filetype plugin indent on

" Line numbers
set number

" Search improvements
set incsearch   " Show matches as you type
set hlsearch    " Highlight all search matches
set ignorecase  " Case-insensitive search
set smartcase   " ...unless you type a capital letter

" Editor behavior
set autoindent  " Inherit indentation from the previous line
set hidden      " Allow switching buffers without saving
set autoread    " Reload files changed outside of Vim
set wildmenu    " Better command-line completion menu
set showmatch   " Briefly jump to matching bracket
set ruler       " Show cursor position in status line
set mouse=a     " Enable mouse support

" System clipboard
set clipboard=unnamedplus

" Modern tab settings: 2-space soft tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Cursor shape per mode (works in most modern terminals)
" Normal mode: block, Insert mode: beam, Replace mode: underline
let &t_SI = "\e[5 q"   " Insert mode — beam cursor
let &t_SR = "\e[3 q"   " Replace mode — underline cursor
let &t_EI = "\e[2 q"   " Normal mode — block cursor

" Buffer navigation
nnoremap q :bnext<CR>
nnoremap <S-l> :bnext<CR>
nnoremap <S-h> :bprevious<CR>
nnoremap <leader>w :bdelete<CR>
nnoremap <C-e> :Buffers<CR>
