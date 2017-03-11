#!/bin/bash
############################
# install.sh
# This script installs, launches databases
############################

echo "Installing databases"

# Install and launch postgres
bash ./postgres/install.sh

# Install and launch mongodb
bash ./mongo/install.sh
