#!/bin/bash
############################
# install.sh
# This script creates symlinks for dotfiles
############################

echo "Linking dotfiles"

# move source dotfiles in targetdir to backupdir
# then create symlinks in targetdir
function backup_and_symlink_dotfiles() {
    local sourcedir=$1        # dotfiles directory
    local targetdir=$2        # target directory
    local backupdir=$3        # old dotfiles backup directory
    local dotfiles=$4         # list of files/folders to symlink in homedir

    echo ""
    echo "Copying dotfiles [$dotfiles] from $sourcedir to $targetdir, backing up in $backupdir"
    echo ""

    # create $targetdir
    echo "Creating the $targetdir directory if it doesn't exist"
    mkdir -p $targetdir
    echo "...done"
    echo ""

    # create backupdir
    echo "Creating $backupdir for backup of any existing dotfiles in $targetdir"
    mkdir -p $backupdir
    echo "...done"
    echo ""

    echo "Moving dotfiles [$dotfiles] from $sourcedir to $targetdir, backing up in $backupdir"
    for file in $dotfiles; do
        # # run install script if it exists
        if [ -e "$sourcedir/$file/install.sh" ]; then
            echo "Running $sourcedir/$file/install.sh"
            echo "";
            bash "$sourcedir/$file/install.sh"
        fi

        # move dotfiles that are not symlinks into $backupdir
        if [ ! \( -h "$targetdir/$file" \) ]; then
            # move file if it exists
            if [ -e "$targetdir/$file" ]; then
                echo "Moving existing file $targetdir/$file to $backupdir";
                mv -f "$targetdir/$file" "$backupdir/$file"
            fi

        # or remove old symlinks to be safe
        else
            echo "Removing existing symlink $targetdir/$file";
            local symlinkpath="$targetdir/$file"
            unlink $symlinkpath
        fi

        echo "Creating symlink to $sourcedir/$file at $targetdir/$file"
        echo "";
        ln -s $sourcedir/$file $targetdir/$file
    done
}

backup_and_symlink_dotfiles ~/dotfiles/dotfiles ~ ~/dotfiles_old ".nvmrc .vimrc .vim .mpd .nethackrc .gitconfig .gitignore"

backup_and_symlink_dotfiles ~/dotfiles/dotfiles/config ~/.config ~/.config/config_old "fish vis ranger"
