#!/bin/bash
############################
# install.sh
# This script installs, launches databases
############################

echo "Installing databases"

# Install and launch postgres
bash databases/postgres/install.sh

# Install and launch mongodb
bash databases/mongo/install.sh
