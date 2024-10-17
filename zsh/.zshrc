# vi: ts=4 sw=0 sts=0 et

# -------------------------------------------
# | ENVIRONMENT VARIABLES                   |
# -------------------------------------------
export LANG=en_US.UTF-8
export EDITOR=nvim
export VISUAL=$EDITOR
export PATH=$HOME/bin:/usr/local/bin:$PATH

# -------------------------------------------
# | ZSH CUSTOMIZATIONS                      |
# -------------------------------------------
bindkey -e
autoload -U compinit; compinit
zstyle ':completion:*' menu select


# -------------------------------------------
# | MOARE SETTINGS                          |
# -------------------------------------------
if [ "$(uname -s)" = 'Darwin' ]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# -------------------------------------------
# | ALIASES AND FUNCTIONS                   |
# -------------------------------------------
alias v="nvim"
alias t='tmux'
alias g='git'


alias glo='git log --oneline'
alias gloga='git log --oneline --graph --all'

alias note='v ~/note'
alias diff='diff --color=always -u'
