#!/bin/sh

set -ex

#
# LXD images recipe: Laravel CLI
#
# Dependencies: cgr
#
# Environment variables:
#
# - none
#


installLaravel() {

# Check the dependencies
command -v cgr > /dev/null || (echo "installLaravel recipe requires cgr, missing"; exit 1)

# Install Laravel CLI
cgr "laravel/installer" "laravel/lumen-installer"

}
