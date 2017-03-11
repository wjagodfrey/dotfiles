#!/bin/bash
############################
# install.sh
# This script installs, launches postgres
############################

echo "Installing postgres"

brew install postgres

echo "Setting up postgres launch agent"
ln -sfv /usr/local/opt/postgresql/*.plist ~/library/launchagents
launchctl load ~/library/launchagents/homebrew.mxcl.postgresql.plist
