set PATH /usr/local/bin $PATH
set PATH /usr/local/sbin $PATH

source ~/.config.fish

alias copy="tr -d '\n' | pbcopy"
alias nvm="bass source ~/.nvm/nvm.sh ';' nvm use ';' nvm"

# fundle plugins
fundle plugin 'edc/bass'

fundle init

# iterm2 3.0 shell integration
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

bass source ~/.nvm/nvm.sh --no-use ';' nvm use > /dev/null

