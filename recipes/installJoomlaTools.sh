#!/bin/sh

set -e

#
# LXD images recipe: Joomla tools
#
# Dependencies: cgr, symfony-autocomplete
#
# Environment variables:
#
# - none
#

installJoomlaTools() {

# Check the dependencies
command -v cgr > /dev/null || (echo "installJoomlaTools recipe requires cgr, missing"; exit 1)
command -v symfony-autocomplete > /dev/null || (echo "installJoomlaTools recipe requires symfony-autocomplete, missing"; exit 1)

# Install Joomla CLI
cgr --update-no-dev joomlatools/console

# Generate autocompletion for Joomla CLI
symfony-autocomplete joomla --shell zsh > /root/.joomla-completion

# Add some stuff for zsh
cat >> /root/.zsh-additions << "EOF"
source /root/.joomla-completion
EOF
}
