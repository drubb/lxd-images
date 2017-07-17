#!/bin/sh

# Exit the script if any command fails
set -e

# Wait for the network being available
rc-service networking start

# Install vue cli
npm -g install vue-cli

# Cleanup
rm -rf /var/cache/apk/* /tmp/*