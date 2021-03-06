#!/bin/bash
############################
# install.sh
# This script installs brew dependancies
############################

echo "Installing Homebrew kegs"

brewKegs="ruby
fortune
mpd
ncmpcpp
fftw
gcc
nethack
fzf
ncurses
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
pipes-sh
ranger
jq"

brew install $brewKegs

brew services start mpd
