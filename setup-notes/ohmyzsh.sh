#!/usr/bin/bash
set -ex

curl -L https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -o install_omz_origin.sh
chmod u+x install_omz_origin.sh
sh ./install_omz_origin.sh --unattended
rm install_omz_origin.sh
