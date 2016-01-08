#!/bin/bash
############################
# link.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="vimrc vim nethackrc gitconfig"   		  # list of files/folders to symlink in homedir

##########

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
    if [ ! \( -h ~/.$file \) &&  ]; then
        echo "moving existing $file to $olddir";
        mv -f ~/.$file $olddir/.$file
    else
        echo "removing existing symlink";
        rm -f ~/.$file
    fi
    echo "Creating symlink to .$file in ~"
    echo "";
    ln -s $dir/$file ~/.$file
done

if [ ! \( -e ~/.vim/bundle/Vundle.vim \) ]; then
    echo "cloning Vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo "installing Vundle plugins"
vim +PluginInstall +qall

echo "complete"
