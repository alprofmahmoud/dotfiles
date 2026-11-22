# fzf: Ctrl+T (files), Alt+C (dirs). Ctrl+R is left to atuin.

# Skip if fzf is not installed
command -v fzf &>/dev/null || return

# Don't bind Ctrl+R (atuin owns it)
export FZF_CTRL_R_COMMAND=

# Debian names it "fdfind", other systems "fd"
if command -v fdfind &>/dev/null; then
    _fd=fdfind
elif command -v fd &>/dev/null; then
    _fd=fd
fi

# Use fd if available, otherwise fzf falls back to find
if [[ -n "$_fd" ]]; then
    export FZF_CTRL_T_COMMAND="$_fd --type f --hidden --follow --exclude .git --exclude node_modules"
    export FZF_ALT_C_COMMAND="$_fd --type d --hidden --follow --exclude .git --exclude node_modules"
fi
unset _fd

# UI: rounded border, red pointer, blue prompt
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --border=rounded --pointer='▌' --color='prompt:blue:bold,pointer:red,info:yellow'"
export FZF_CTRL_T_OPTS="--prompt='❯ Files '"

# Load key bindings and completion
source <(fzf --zsh)
