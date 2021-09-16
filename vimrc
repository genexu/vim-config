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

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
Plug 'leafgarland/typescript-vim'
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

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver']

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" CoC GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
