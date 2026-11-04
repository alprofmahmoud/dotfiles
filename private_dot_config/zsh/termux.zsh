export SSH_AUTH_SOCK="$HOME/.ssh/agent.sock"
ssh-add -l >/dev/null 2>&1
if [ $? -eq 2 ]; then
  rm -f "$SSH_AUTH_SOCK"
  ssh-agent -a "$SSH_AUTH_SOCK" >/dev/null
fi
