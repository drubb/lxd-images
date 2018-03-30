#!/bin/sh

set -e

#
# LXD images recipe: Golang
#
# Dependencies: none
#
# Environment variables:
#
# - none
#

installGolang() {

# Install Golang development packages
apk --update add go go-doc go-tools libc-dev

}
