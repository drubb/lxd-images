#!/bin/sh

set -ex

#
# LXD images recipe: Ember CLI
#
# Dependencies: npm
#
# Environment variables:
#
# - none
#

installEmberCli() {

# Check the dependencies
command -v npm > /dev/null || (echo "installEmberCli recipe requires npm, missing"; exit 1)

# Install Ember CLI
npm -g install ember-cli

}
