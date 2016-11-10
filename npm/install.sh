#!/bin/bash
############################
# install.sh
# This script installs global npm dependancies
############################

npmModules="jshint
jslint
eslint
nodemon
vtop
markserv"

npm i -g $npmModules
