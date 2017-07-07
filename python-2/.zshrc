# Enable color support for the terminal
export TERM=xterm-256color

# Set the shell
export SHELL=/bin/zsh

# Configure zsh / oh-my-zsh
export ZSH=/root/.oh-my-zsh
export ZSH_THEME=essembeh
DISABLE_AUTO_UPDATE=true
plugins=(git python pip ssh-agent)
source $ZSH/oh-my-zsh.sh