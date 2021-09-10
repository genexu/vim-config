#!/bin/sh

VIMRC_DIR="$HOME/.vimrc"
VIM_DIR="$HOME/.vim"
VIM_AUTOLOAD_DIR="$HOME/.vim/autoload"
VIM_BUNDLE_DIR="$HOME/.vim/bundle"
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

if [ ! -d "$VIM_DIR" ]; then
    echo "Make vim dir"
    mkdir $VIM_DIR
fi

if [ ! -d "$VIM_AUTOLOAD_DIR" ]; then
    echo "Make vim autoload dir"
    mkdir $VIM_AUTOLOAD_DIR
fi

if [ ! -d "$VIM_BUNDLE_DIR" ]; then
    echo "Make vim bundle dir"
    mkdir $VIM_BUNDLE_DIR
fi

echo "Install and setup pathogen runtimepath executor"
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "Install and setup vim-plug plugin manager"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Install and setup color theme"
git clone https://github.com/joshdick/onedark.vim.git ~/.vim/bundle/onedark.vim

vim +PlugInstall +qall

echo "Setup done. If you want to change vim-config repo directory, please remember relink vimrc again."
