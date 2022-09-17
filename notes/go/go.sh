rm -rf /usr/local/go
tar -C /usr/local -xzf go.tar.gz

export PATH=/usr/local/go/bin:$PATH

git clone https://github.com/fatih/vim-go.git ~/.local/share/nvim/site/pack/plugins/start/vim-go
