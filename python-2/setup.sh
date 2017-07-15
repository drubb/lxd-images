#!/bin/sh

# Exit the script if any command fails
set -e

# Wait for the network being available
rc-service networking start

# Add Python 2 and build tools
apk update && apk upgrade
apk add build-base python2-dev py2-pip

# Cleanup
rm -rf /var/cache/apk/* /tmp/*