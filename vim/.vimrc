call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-abolish'

Plug 'junegunn/vim-easy-align',       { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity']      }
Plug 'junegunn/vim-emoji'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
Plug 'junegunn/vim-fnr'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-journal'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vader.vim',  { 'on': 'Vader', 'for': 'vader' }

" Colors
Plug 'tomasr/molokai'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'junegunn/seoul256.vim'
Plug 'shawncplus/skittles_berry'
Plug 'altercation/vim-colors-solarized'

" Edit
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary',        { 'on': '<Plug>Commentary' }
Plug 'mbbill/undotree',             { 'on': 'UndotreeToggle'   }
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'bronson/vim-trailing-whitespace'

" Tmux
Plug 'tpope/vim-tbone'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'justinmk/vim-gtfo'
Plug 'tpope/vim-fugitive'
Plug 'groenewege/vim-less'
Plug 'pangloss/vim-javascript'
Plug 'slim-template/vim-slim'
Plug 'chrisbra/unicode.vim', { 'for': 'journal' }

call plug#end()

set t_Co=256
set nocompatible
set noswapfile
set autoindent
set smartindent
set smarttab
set copyindent
set number
set tabstop=4
set shiftwidth=4
set expandtab
set shiftround
set incsearch
set ignorecase
set hlsearch
set noerrorbells
set relativenumber
set nowrap
set encoding=utf-8
set nrformats=
set hidden
set history=100

filetype on
syntax on
colorscheme seoul256

