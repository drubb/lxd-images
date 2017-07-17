#!/bin/sh

# Exit the script if any command fails
set -e

# Wait for the network being available
rc-service networking start

# Add Python 3 and build tools
apk update && apk upgrade
apk add build-base python3-dev

# Create symlinks for python and pip
ln -s /usr/bin/python3 /usr/bin/python
ln -s /usr/bin/pip3 /usr/bin/pip

# Cleanup
rm -rf /var/cache/apk/* /tmp/*