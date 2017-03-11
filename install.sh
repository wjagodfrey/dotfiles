#!/bin/bash
############################
# install.sh
# This script runs all dotfile linking and dependency install tasks
############################

# Link dotfiles
bash ./dotfiles/install.sh

# Install brew kegs
bash ./brew/install.sh

# Install and launch databases
bash ./databases/install.sh

# Install and configure fish
bash ./fish/install.sh

# Install and configure vim
bash ./vim/install.sh

# Install node and global npm modules
bash ./node/install.sh

echo "^^^^COMPLETE^^^^"
