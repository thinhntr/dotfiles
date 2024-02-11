if [ -z "$SSH_AGENT_PID" ]; then
    eval "$(ssh-agent -s)"
    if [ -f ~/.ssh/LOAD_ME ]; then
        keys=($(cat ~/.ssh/LOAD_ME))
        for key in "${keys[@]}"; do
            ssh-add ~/.ssh/$key
        done
    fi
fi
