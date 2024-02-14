#!/usr/bin/env bash
set -ex

# https://github.com/pyenv/pyenv
# https://github.com/pyenv/pyenv-installer
curl https://pyenv.run | bash

sudo apt-get update; sudo apt-get install make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev -y

pyenv install 3.10.8

