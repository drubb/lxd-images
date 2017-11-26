#!/bin/sh

set -ex

#
# LXD images recipe: Cleanup
#
# Dependencies: none
#
# Environment variables:
#
# - none
#

cleanup() {
echo Final cleanup...
command -v composer > /dev/null && composer clear-cache &> /dev/null
command -v npm > /dev/null && npm -g cache clean --force &> /dev/null
rm -rf /var/cache/apk /tmp > /dev/null
}
