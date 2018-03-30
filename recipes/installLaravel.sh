#!/bin/sh

set -e

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
cgr --update-no-dev laravel/installer laravel/lumen-installer

}
