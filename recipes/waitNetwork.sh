#!/bin/sh

set -ex

#
# LXD images recipe: Wait for network start
#
# Dependencies: none
#

waitNetwork() {
sleep 5
}
