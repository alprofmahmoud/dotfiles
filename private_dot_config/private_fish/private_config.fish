# Run commands only in interactive sessions
if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Disable default greeting (using custom function below)
# set fish_greeting ""

# Force 256 color support
set -gx TERM xterm-256color

# ============================
# Theme Settings
# ============================
set -g theme_color_scheme terminal-dark
# Show only last directory in prompt
set -g fish_prompt_pwd_dir_length 1
# Display username in prompt
set -g theme_display_user yes
# Always show hostname
set -g theme_hide_hostname no
set -g theme_hostname always

# ============================
# Editor
# ============================
# Use nvim as default editor if installed
command -qv nvim && alias vim nvim
set -gx EDITOR nvim

# Initialize zoxide (smart cd replacement) if installed
if command -v zoxide &>/dev/null
    zoxide init fish | source
end

# Initialize atuin
if status is-interactive; and command -v atuin &>/dev/null
    atuin init fish | source
end
# ============================
# Aliases
# ============================
source ~/.config/fish/aliases.fish

# ============================
# PATH
# ============================
# User-installed packages
set -gx PATH ~/.local/bin $PATH

# ============================
# NVM - Auto Node Version Switch
# ============================
# Automatically switch Node version when entering a directory with .nvmrc
function __check_nvm --on-variable PWD --description 'Do nvm stuff'
    # Skip if running inside a command substitution
    status --is-command-substitution; and return

    # Switch Node version if .nvmrc exists and is readable
    if test -f .nvmrc; and test -r .nvmrc
        nvm use
    end
end

# ============================
# Greeting
# ============================
# Custom greeting showing time and hostname
function fish_greeting
    echo Hello Pro
    echo The time is (set_color yellow; date +%T; set_color normal) and this machine is called $hostname
end
