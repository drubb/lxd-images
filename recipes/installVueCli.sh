#!/bin/sh

set -e

#
# LXD images recipe: Vue CLI
#
# Dependencies: npm
#
# Environment variables:
#
# - none
#

installVueCli() {

# Check the dependencies
command -v npm > /dev/null || (echo "installVueCli recipe requires npm, missing"; exit 1)

# Install Vue.js CLI
npm -g install vue-cli

}
