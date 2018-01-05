#!/bin/bash
############################
# install.sh
# This script runs all dotfile linking and dependency install tasks
############################

# Link dotfiles
bash ~/dotfiles/dotfiles/install.sh

# Install brew kegs
bash ~/dotfiles/brew/install.sh

# Install and launch databases
bash ~/dotfiles/databases/install.sh

# Install powerline fonts
bash ~/dotfiles/fonts/install.sh

# Install and configure vim
bash ~/dotfiles/vim/install.sh

# Install node and global npm modules
bash ~/dotfiles/node/install.sh

# Install cli-visualiser (vis)
bash ~/dotfiles/vis/install.sh

echo "All done. Restart your terminal to see all changes."
