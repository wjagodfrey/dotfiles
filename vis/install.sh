#!/bin/bash
############################
# install.sh
# This script installs cli-visualiser
############################

echo "Installing cli-visualiser"

mkdir -p ~/.installers/cli-visualizer

git clone https://github.com/dpayne/cli-visualizer ~/.installers/cli-visualizer

cd ~/.installers/cli-visualizer

bash ~/.installers/cli-visualizer/install.sh

rm -rf ~/.installers/cli-visualizer

echo "...done"
echo ""
