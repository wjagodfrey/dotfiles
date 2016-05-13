#!/bin/bash
############################
# link.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                                      # dotfiles directory
olddir=~/dotfiles_old                               # old dotfiles backup directory
files="vimrc vim nethackrc gitconfig gitignore"   	# list of files/folders to symlink in homedir

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


echo "Installing Homebrew kegs"

brewKegs="fish
macvim --with-override-system-vim
node
ruby
fzf
slurm
htop
iftop
cmake
ngrok
mcrypt
openssl
graphviz
mongodb
postgres
dos2unix
coreutils
aspell
the_silver_searcher"

brew install $brewKegs

echo "Setting up mongodb launch agent"
ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist

echo "Setting up postgres launch agent"
ln -sfv /usr/local/opt/postgresql/*.plist ~/library/launchagents
launchctl load ~/library/launchagents/homebrew.mxcl.postgresql.plist

echo "Setting up fish as default shell"
grep -q -F '/usr/local/bin/fish' /etc/shells || echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish


# Install Vundle if it doesn't exist
if [ ! \( -e ~/.vim/bundle/Vundle.vim \) ]; then
    echo "Cloning Vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Install Vundle plugins
echo "Installing Vundle plugins"
vim +PluginInstall +qall

# Link fish config
bash ./fish/install.sh

# install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash

# set nvm version
nvm install 6.1
nvm use 6.1

# Install global npm modules
bash ./npm/install.sh

echo "^^^^COMPLETE^^^^"
