#!/bin/sh

set -e

#
# LXD images recipe: Wait for network start
#
# Dependencies: none
#

waitNetwork() {
service networking restart
}
