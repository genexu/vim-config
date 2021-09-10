"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()

" Set mouse mode
set mouse=a

" Set read lines history
set history=500

" Set to auto read watch file changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Turn on the wild menu and set wildignore file type
set wildmenu
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Enable filetype plugins
filetype plugin on
filetype indent on

" Show status bar position ruler and cursorline
set ruler
set cursorline

" Backspace configuration
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Searching case configuration
set ignorecase
set smartcase
set nohlsearch
set incsearch 

" Disable redraw while executing macros and ture off compatible mode (performance improvement)
set lazyredraw 
set nocompatible

" For regular expressions turn magic on
set magic

" No sound on errors
set noerrorbells
set novisualbell
set tm=500

set nofoldenable


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors, Fonts and Encoding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

set encoding=utf8
set background=dark
set fileformats=unix,dos,mac
colorscheme onedark


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

set autoindent
set smartindent
set wrap


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Git
Plugin 'tpope/vim-fugitive'

" Searching
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'

" Interface
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Theme
Plugin 'joshdick/onedark.vim'

" Language
Plugin 'pangloss/vim-javascript'
Plugin 'chemzqm/vim-jsx-improve'
Plugin 'othree/html5.vim'
Plugin 'fatih/vim-go'
Plugin 'elzr/vim-json'
Plugin 'plasticboy/vim-markdown'
Plugin 'oranget/vim-csharp'
Plugin 'martinda/jenkinsfile-vim-syntax'

call vundle#end()

call plug#begin('~/.vim/plugged')

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

" Initialize plugin system
call plug#end()

let NERDTreeShowHidden=1
let g:jsx_ext_required = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'


let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
