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
~/.nvm/nvm.sh install 7.6
~/.nvm/nvm.sh use 7.6
npm i -g $(echo "$npmModules" | tr '\n' ' ')
"

echo "Running:$command"
bash -c "$command"
