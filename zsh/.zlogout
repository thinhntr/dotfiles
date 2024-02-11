if ! tmux list-session > /dev/null 2>&1; then
  kill $(pgrep ssh-agent)
fi
