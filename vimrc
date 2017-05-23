syntax on

set history=100

set tabstop=4
set softtabstop=4
set expandtab

set cursorline
set ruler
set wildmenu

set nocompatible              " be improved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

call vundle#end()            " required
filetype plugin indent on    " required
