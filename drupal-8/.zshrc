# Add global composer and yarn binaries to the path
export PATH="$PATH:/root/.composer/vendor/bin:/root/.yarn/bin"

# Enable color support for the terminal
export TERM=xterm-256color

# Composer may run as root
export COMPOSER_ALLOW_SUPERUSER=1

# Set the shell
export SHELL=/bin/zsh

# Configure zsh / oh-my-zsh
export ZSH=/root/.oh-my-zsh
export ZSH_THEME=essembeh
DISABLE_AUTO_UPDATE=true
plugins=(git npm yarn ssh-agent)
source $ZSH/oh-my-zsh.sh

# Disable globbing for some commands using version constraints
alias composer='noglob composer'
alias npm='noglob npm'
alias yarn='noglob yarn'