if [ -n "$SSH_AGENT_PID" ]; then
    return 0
fi

eval "$(ssh-agent -s)"

if [ ! -f ~/.ssh/LOAD_ME ]; then
    return 0
fi

keys=($(cat ~/.ssh/LOAD_ME))
for key in "${keys[@]}"; do
    [ "${key:0:1}" = "#" ] && continue
    ssh-add ~/.ssh/$key
done
