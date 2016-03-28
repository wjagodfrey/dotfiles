set PATH /usr/local/bin $PATH
set PATH /usr/local/sbin $PATH
set PATH ~/.node/bin $PATH
set PATH ~/.nvm/nvm.sh $PATH

source ~/.config.fish

alias copy="tr -d '\n' | pbcopy"
alias nvm="bass source ~/.nvm/nvm.sh ';' nvm"

# fundle plugins
fundle plugin 'edc/bass'

fundle init

