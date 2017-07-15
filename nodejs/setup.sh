#!/bin/sh

# Exit the script if any command fails
set -e

# Wait for the network being available
rc-service networking start

# Add Node.js and build tools
apk update && apk upgrade
apk add build-base nodejs
npm -g install npm

# Cleanup
rm -rf /var/cache/apk/* /tmp/*