#!/bin/bash
############################
# install.sh
# This script installs vim dependencies
############################

echo "Installing VIM and its dependencies"

brew install macvim --with-override-system-vim

# Install Vundle if it doesn't exist
if [ ! \( -e ~/.vim/bundle/Vundle.vim \) ]; then
    echo "Cloning Vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Install Vundle plugins
echo "Installing Vundle plugins"
vim +PluginInstall +qall
