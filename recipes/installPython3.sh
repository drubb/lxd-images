#!/bin/sh

set -ex

#
# LXD images recipe: Python 3
#
# Dependencies: none
#
# Environment variables:
#
# - none
#

installPython3() {

# Install Python 3 development packages
apk --update add build-base python3-dev

# Create symbolic links for python and pip commands
ln -s /usr/bin/python3 /usr/bin/python
ln -s /usr/bin/pip3 /usr/bin/pip

}
