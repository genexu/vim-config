#!/bin/sh

VIMRC_DIR="$HOME/.vimrc"
VUNDLE_DIR="$HOME/.vim/bundle/Vundle.vim"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if ! type vim > /dev/null; then
    echo "Vim is required but it's not installed.  Aborting."
fi

if [ -f "$VIMRC_DIR" ]; then
    read -p "There is already have vimrc file in your home directory, are you sure you want to overwrite it and continue?" REPLY
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Aborting."    
        exit 1
    else
        echo "Remove old vimrc file"
        rm "$VIMRC_DIR"
    fi
fi

echo "Create symbolic link from vim-config repo vimrc file to home directory."
ln -s "$SCRIPT_DIR"/vimrc ~/.vimrc


if [ ! -d "$VUNDLE_DIR" ]; then
    echo "install and setup vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim +PluginInstall +qall

echo "Setup done. If you want to change vim-config repo directory, please remember relink vimrc again."
