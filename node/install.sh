#!/bin/bash
############################
# install.sh
# This script installs global npm dependancies
############################

echo "Installing NodeJS with NVM"

# install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash

# install and use node version
nvm install 7.6
nvm use 7.6

echo "Installing global NPM packages"


npmModules="jshint
webtorrent-cli
jslint
eslint
nodemon
vtop
cowsay
markserv"

npm i -g $npmModules
