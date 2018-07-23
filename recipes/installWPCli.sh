#!/bin/sh

set -e

#
# LXD images recipe: WP CLI
#
# Dependencies: cgr, curl
#
# Environment variables:
#
# - none
#

installWPCli() {

# Check the dependencies
command -v cgr > /dev/null || (echo "installWPCli recipe requires cgr, missing"; exit 1)
command -v curl > /dev/null || (echo "installWPCli recipe requires curl, missing"; exit 1)

# Install Wordpress CLI
cgr --update-no-dev wp-cli/wp-cli

# Fetch the autocompletion script
curl https://raw.githubusercontent.com/wp-cli/wp-cli/master/utils/wp-completion.bash -L -o /root/.wp-completion

# Remove wp.bat, disturbing autocompletion
rm /root/.composer/vendor/bin/wp.bat

# Create additional settings for zsh
cat >> /root/.zsh-additions << "EOF"
source /root/.wp-completion
alias wp='wp --allow-root'
EOF
}
