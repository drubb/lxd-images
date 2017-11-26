#!/bin/sh

set -ex

#
# LXD images script: Build all images
#
# This script is used to build all images in the images sub folder at once
#

# Build all images found in the images sub folder
cd images
find . -maxdepth 1 -type d \( ! -name . \) -exec sh -c "cd '{}' && sh ../build.sh" \;
cd ..
