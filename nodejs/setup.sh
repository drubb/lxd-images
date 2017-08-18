#!/bin/sh

# Exit the script if any command fails
set -e

# Wait for the network being available
rc-service networking start

# Add build tools
apk update && apk upgrade
apk add build-base nodejs-dev

# Cleanup
rm -rf /var/cache/apk/* /tmp/*