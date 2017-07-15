#!/bin/sh

# Exit the script if any command fails
set -e

# Wait for the network being available
rc-service networking start

# Add node.js and vue cli
apk update && apk upgrade
apk add nodejs
npm -g install npm vue-cli

# Cleanup
rm -rf /var/cache/apk/* /tmp/*