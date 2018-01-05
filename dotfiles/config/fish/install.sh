#!/bin/bash
############################
# install.sh
# This script symlinks fish config and functions to ~/.config/fish/
############################

echo "Installing and configuring fish"

########## Installation

brew install fish

##########

# Install fundle
mkdir -p ~/.config/fish/functions
curl https://raw.githubusercontent.com/tuvistavie/fundle/master/functions/fundle.fish -o ~/.config/fish/functions/fundle.fish

fish -c 'fundle install'

echo "Setting up fish as default shell"
grep -q -F '/usr/local/bin/fish' /etc/shells || echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
