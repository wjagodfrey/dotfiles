#!/usr/local/bin/fish
############################
# config.fish
# This script configures the shell for node
############################

# alias nvm through bass
alias nvm="bass source ~/.nvm/nvm.sh --no-use ';' nvm"

# set correct node version on shell start. defaults to nvmrc in ~
bass source ~/.nvm/nvm.sh --no-use ';' nvm use > /dev/null
