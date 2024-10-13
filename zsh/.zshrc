# vi: ts=4 sw=0 sts=0 et

bindkey -e

export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8
export EDITOR=nvim
export VISUAL=$EDITOR
export PATH=$HOME/bin:/usr/local/bin:$PATH

alias v="nvim"
alias t='tmux'
alias g='git'


alias glo='git log --oneline'
alias gloga='git log --oneline --graph --all'

alias note='v ~/note'
alias diff='diff --color=always -u'

if [ "$(uname -s)" = 'Darwin' ]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
[ -f ~/.sc.zsh ] && source ~/.sc.zsh
