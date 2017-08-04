#!/bin/sh

# Exit the script if any command fails
set -e

# Wait for the network being available
rc-service networking start

# Add go and some tools
apk update && apk upgrade
apk add go go-doc go-tools libc-dev

# Cleanup
rm -rf /var/cache/apk/* /tmp/*