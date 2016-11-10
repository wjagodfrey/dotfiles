#!/bin/bash
############################
# install.sh
# This script installs global npm dependancies
############################

npmModules="jshint
jslint
markserv"

npm i -g $npmModules
