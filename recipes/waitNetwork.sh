#!/bin/sh

set -ex

#
# LXD images recipe: Wait for network start
#
# Dependencies: none
#

waitNetwork() {
service networking restart
}
