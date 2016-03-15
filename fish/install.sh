#!/bin/bash
############################
# install.sh
# This script symlinks fish config and functions to ~/.config/fish/
############################

########## Variables

filedir=~/dotfiles/fish                             # fish config directory
installdir=~/.config/fish                           # new fish config directory
cachedir=~/.config/old_fish                         # old fish config backup directory
files="config.fish functions"                      	# list of files/folders to symlink in ~/.config/fish/

##########

# create $cachedir
echo "Creating $cachedir for backup of any existing fish configs in $installdir"
mkdir -p $cachedir
echo "...done"
echo ""

# change to the $filedir directory
echo "Changing to the $filedir directory"
cd $filedir
echo "...done"
echo ""

# move any existing fish config files to the $cachedir, then create symlinks
echo "Moving any existing config files from $installdir to $cachedir"
for file in $files; do
    # move config files that are not symlinks into $cachedir
    if [ ! \( -h $installdir/$file \) ]; then
        echo "Moving existing file $installdir/$file to $cachedir";
        mv -f $installdir/$file $cachedir/$file
    # or remove old symlinks to be safe
    else
        echo "Removing existing symlink $installdir/$file";
        rm -f $installdir/$file
    fi
    echo "Creating symlink to .$file in $installdir"
    echo "";
    ln -s $filedir/$file $installdir/$file
done

# Install fundle
mkdir -p ~/.config/fish/functions
curl https://raw.githubusercontent.com/tuvistavie/fundle/master/functions/fundle.fish -o ~/.config/fish/functions/fundle.fish

fish -c 'fundle install'
