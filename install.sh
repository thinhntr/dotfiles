#/usr/bin/env bash

sudo apt install -y tmux \
                    curl \
                    zsh \
                    xsel


# Set up zsh
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Copy config
cp zsh/.zshrc ~/.zshrc
cp zsh/.oh-my-zsh/themes/fishy.zsh-theme ~/.oh-my-zsh/themes/fishy.zsh-theme

# Install catppuccin
# gnome-terminal
curl -L https://raw.githubusercontent.com/catppuccin/gnome-terminal/v0.2.0/install.py | python3 -

# Tmux config
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp tmux/.tmux.conf ~/.tmux.conf
tmux source ~/.tmux.conf

# Install packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
