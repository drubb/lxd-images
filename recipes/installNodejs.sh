#!/bin/sh

set -e

#
# LXD images recipe: Nodejs
#
# Dependencies: none
#
# Environment variables:
#
# - none
#

installNodejs() {

# Install node.js development packages
apk --update add build-base nodejs-dev

}
