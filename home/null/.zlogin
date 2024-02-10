if [ -z "$SSH_AGENT_PID" ]; then
    eval "$(ssh-agent -s)"
    ssh-add blabla
fi
