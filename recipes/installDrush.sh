#!/bin/sh

set -e

#
# LXD images recipe: Drush
#
# Dependencies: cgr
#
# Environment variables:
#
# - DRUSH_VERSION: Drush version (8/9), default '8'
#

installDrush() {

DRUSH_VERSION=${DRUSH_VERSION:-"8"}

# Check the dependencies
command -v cgr > /dev/null || (echo "installDrush recipe requires cgr, missing"; exit 1)

# Install Drush
cgr --update-no-dev drush/drush:^${DRUSH_VERSION}

# Add Drush command completion for zsh
cat >> /root/.zsh-additions << "EOF"
source /root/.composer/vendor/bin/drush.complete.sh
EOF

}
