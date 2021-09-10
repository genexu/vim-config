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
call plug#begin('~/.vim/plugged')

" Linter
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

" Git
Plug 'tpope/vim-fugitive'

" Searching
Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim'

" Interface
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Theme
Plug 'joshdick/onedark.vim'

" Language
Plug 'pangloss/vim-javascript'
Plug 'chemzqm/vim-jsx-improve'
Plug 'othree/html5.vim'
Plug 'fatih/vim-go'
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'
Plug 'oranget/vim-csharp'
Plug 'martinda/jenkinsfile-vim-syntax'

" Initialize plugin system
call plug#end()

let NERDTreeShowHidden=1
let g:jsx_ext_required = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'


let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
