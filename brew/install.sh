#!/bin/bash
############################
# install.sh
# This script installs brew dependancies
############################

echo "Installing Homebrew kegs"

brewKegs="ruby
fortune
fzf
slurm
htop
iftop
cmake
mcrypt
openssl
graphviz
dos2unix
coreutils
aspell
the_silver_searcher
jq"

brew install $brewKegs
