syntax on

if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical Bar In Insert Mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block In Normal Mode
endif

set mouse=a
set backspace=indent,eol,start

set encoding=utf-8
set history=100
set laststatus=2

set autoindent
set copyindent
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set smarttab
set shiftround
set ignorecase
set smartcase

set autoread

set cursorline
set ruler
set wildmenu

set nu
set updatetime=100

set nocompatible              " be improved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

set backspace=indent,eol,start

Plugin 'VundleVim/Vundle.vim'

" General
Plugin 'mattn/emmet-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'

" Completion
Plugin 'valloric/youcompleteme'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" Interface
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Language
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'othree/html5.vim'
Plugin 'fatih/vim-go'
Plugin 'elzr/vim-json'
Plugin 'plasticboy/vim-markdown'
Plugin 'oranget/vim-csharp'
Plugin 'posva/vim-vue'
Plugin 'leafgarland/typescript-vim'
Plugin 'ianks/vim-tsx'

call vundle#end()            " required
filetype plugin indent on    " required

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

nnoremap <Leader>fu :CtrlPFunky<Cr>
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

let g:ctrlp_funky_syntax_highlight = 1

let NERDTreeShowHidden=1
