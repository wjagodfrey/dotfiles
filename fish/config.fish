#!/usr/local/bin/fish
############################
# config.fish
# Main fish shell configuration file
############################

# set $PATH
set PATH /usr/local/bin $PATH
set PATH /usr/local/sbin $PATH

# optional local fish config file
source ~/.config.fish

# fish plugins file
source ~/dotfiles/fish/plugins.fish

# fish nodejs config file
source ~/dotfiles/node/config.fish

# iterm2 3.0 shell integration
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/wilfredgodfrey/.nvm/versions/node/v7.6.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish ]; and . /Users/wilfredgodfrey/.nvm/versions/node/v7.6.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/wilfredgodfrey/.nvm/versions/node/v7.6.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish ]; and . /Users/wilfredgodfrey/.nvm/versions/node/v7.6.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish