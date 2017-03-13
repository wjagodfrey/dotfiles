#!/bin/bash
############################
# install.sh
# This script creates symlinks from the home directory to any of the listed dotfiles
############################

########## Variables

dir=~/dotfiles/dotfiles                          # dotfiles directory
olddir=~/dotfiles_old                            # old dotfiles backup directory
files="nvmrc vimrc vim nethackrc gitconfig gitignore"  # list of files/folders to symlink in homedir

##########

echo "Linking dotfiles"

# create dotfiles_old in ~
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"
echo ""

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"
echo ""

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
    # move dotfiles that are not symlinks into $olddir
    if [ ! \( -h ~/.$file \) ]; then
        echo "Moving existing file ~/.$file to $olddir";
        mv -f ~/.$file $olddir/.$file
    # or remove old symlinks to be safe
    else
        echo "Removing existing symlink ~/.$file";
        rm -f ~/.$file
    fi
    echo "Creating symlink to .$file in ~"
    echo "";
    ln -s $dir/$file ~/.$file
done

