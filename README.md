
# Dotfiles and Install Scripts

## Installation

To set up a fresh computer without `git` or `brew`, run the following commands:
```
bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git
git clone https://github.com/wjagodfrey/dotfiles.git ~/dotfiles
bash ~/dotfiles/link.sh
exit

```

To install on a computer with both `git` and `brew` just run this:
```
bash
git clone https://github.com/wjagodfrey/dotfiles.git ~/dotfiles
bash ~/dotfiles/link.sh
exit

```

