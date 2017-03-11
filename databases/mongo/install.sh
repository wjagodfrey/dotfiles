#!/bin/bash
############################
# install.sh
# This script installs, launches mongodb
############################

echo "Installing mongodb"

brew install mongodb

echo "Setting up mongodb launch agent"
ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist
