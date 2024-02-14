#!/usr/bin/bash
set -ex

sudo apt-get update -qq && sudo apt-get install ripgrep fzf

curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
sudo chmod +x /usr/local/bin/nvim
sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/nvim 100
sudo apt-get update -qq && sudo apt-get -y install libfuse2
