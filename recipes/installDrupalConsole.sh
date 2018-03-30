#!/bin/sh

set -e

#
# LXD images recipe: Drupal Console
#
# Dependencies: curl, ZSH
#
# Environment variables:
#
# - none
#

installDrupalConsole() {

# Check the dependencies
command -v curl > /dev/null || (echo "installDrupalConsole recipe requires curl, missing"; exit 1)
command -v zsh > /dev/null || (echo "installDrupalConsole recipe requires zsh, missing"; exit 1)

# Install Drupal Console
curl https://drupalconsole.com/installer -L -o /usr/local/bin/drupal
chmod +x /usr/local/bin/drupal

# Add Drupal Console command completion for zsh
zsh -c "drupal init --autocomplete -n"
cat >> /root/.zsh-additions << "EOF"
source /root/.console/console.rc
EOF

}
