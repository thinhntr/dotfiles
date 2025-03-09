# vi: ts=4 sw=0 sts=0 et nowrap

# -------------------------------------------
# | ENVIRONMENT VARIABLES                   |
# -------------------------------------------
export LANG=en_US.UTF-8
export EDITOR=nvim
export VISUAL=nvim
export KUBE_EDITOR=nvim
export PATH="$HOME/flutter/bin:$HOME/bin:/usr/local/bin:$PATH"

WORDCHARS="*?_.[]~=&;!#$%^(){}<>"
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# -------------------------------------------
# | ZSH CUSTOMIZATIONS                      |
# -------------------------------------------
bindkey -e
autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files
zstyle ':completion:*' menu select
# Allow to select in a menu
zstyle ':completion:*' menu select
# Define completers
zstyle ':completion:*' completer _extensions _complete _approximate
# See ZSHCOMPWID "completion matching control"
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'


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

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# -------------------------------------------
# | ALIASES AND FUNCTIONS                   |
# -------------------------------------------
alias v="nvim"
alias t='tmux'
alias ls='ls --color=auto'


alias g='git'
alias glo='git log --oneline'
alias gloga='git log --oneline --graph --all'

alias note='v ~/note'
alias diff='diff --color=auto -u'

alias pgg='curl https://api.ipify.org'

alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
