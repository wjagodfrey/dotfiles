#!/bin/bash
############################
# install.sh
# This script installs global npm dependancies
############################

echo "Installing NodeJS with NVM"

# install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash

echo "Installing global NPM packages"

npmModules="jshint
webtorrent-cli
jslint
eslint
nodemon
vtop
cowsay
serverless
markserv"

command="
bass source ~/.nvm/nvm.sh --no-use ';'\
nvm install 7.6 ';'\
nvm alias default 7.6 ';'\
nvm ls
npm i -g $(echo "$npmModules" | tr '\n' ' ')
"


echo "Running:$command"
fish -c "$command"
