
# Dotfiles and Install Scripts

## Installation

You will need xcode, and xcode commandline tools. Once they are installed, run:

```
sudo xcodebuild -license
```

And agree to the terms.

To set up a fresh computer without `git` or `brew`, run the following commands:

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

```
bash
brew install git
git clone https://github.com/wjagodfrey/dotfiles.git ~/dotfiles
bash ~/dotfiles/install.sh
exit

```

To install on a computer with both `git` and `brew` just run this:
```
bash
git clone https://github.com/wjagodfrey/dotfiles.git ~/dotfiles
bash ~/dotfiles/install.sh
exit

```

