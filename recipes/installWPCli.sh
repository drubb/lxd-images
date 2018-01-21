#!/bin/sh

set -ex

#
# LXD images recipe: WP CLI
#
# Dependencies: cgr, symfony-autocomplete
#
# Environment variables:
#
# - none
#

installWPCli() {

# Check the dependencies
command -v cgr > /dev/null || (echo "installWPCli recipe requires cgr, missing"; exit 1)
command -v symfony-autocomplete > /dev/null || (echo "installWPCli recipe requires symfony-autocomplete, missing"; exit 1)

# Install Wordpress CLI
cgr --update-no-dev wp-cli/wp-cli

# Generate the autocompletion script
symfony-autocomplete wp --shell zsh > /root/.wp-completion

# Create additional settings for zsh
cat >> /root/.zsh-additions << "EOF"
source /root/.wp-completion
alias wp='wp --allow-root --no-color'
EOF
}
