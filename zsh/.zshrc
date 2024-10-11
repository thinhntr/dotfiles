# vi: ts=4 sw=0 sts=0 et

# -------------------------------------------
# | ENVIRONMENT VARIABLES                   |
# -------------------------------------------
export LANG=en_US.UTF-8
export EDITOR=nvim
export VISUAL=$EDITOR
export KUBE_EDITOR=$EDITOR
export PATH="$HOME/bin:/usr/local/bin:$PATH"

WORDCHARS=""
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE

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
elif [[ "$(uname -s)" = 'Linux' && -d "/usr/share/zsh-syntax-highlighting" ]]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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

alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
