#!/bin/sh

set -ex

#
# LXD images recipe: Python 2
#
# Dependencies: none
#
# Environment variables:
#
# - none
#

installPython2() {

# Install Python 2 development packages
apk --update add build-base python2-dev py2-pip

}
