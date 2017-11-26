#!/bin/sh

set -ex

#
# LXD images recipe: React CLI
#
# Dependencies: npm
#
# Environment variables:
#
# - none
#

installReactCli() {

# Check the dependencies
command -v npm > /dev/null || (echo "installReactCli recipe requires npm, missing"; exit 1)

# Install React CLI
npm -g install create-react-app

}
