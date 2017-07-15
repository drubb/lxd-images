# Enable color support for the terminal
export TERM=xterm-256color

# Set the shell
export SHELL=/bin/zsh

# Configure zsh / oh-my-zsh
export ZSH=/root/.oh-my-zsh
export ZSH_THEME=essembeh
DISABLE_AUTO_UPDATE=true
plugins=(git npm ssh-agent)
source $ZSH/oh-my-zsh.sh

# Disable zsh globbing for npm, it's using version constraints
alias npm='noglob npm'

# Add optional stuff from .zsh-additions, if any
source .zsh-additions 2> /dev/null || true