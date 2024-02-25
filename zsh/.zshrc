export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8
export EDITOR=nvim
export VISUAL=$EDITOR

alias v="nvim"
alias diff='diff --color=always -u'
alias t='tmux'

alias note='v ~/note'

plugins=(
    brew
    git
    fzf
    starship
    zoxide
    zsh-syntax-highlighting
)

[ -f ~/.more_plugins ] && plugins+=($(grep -v '^#' ~/.more_plugins))
source $ZSH/oh-my-zsh.sh

[ -f ~/.sc.zsh ] && source ~/.sc.zsh
