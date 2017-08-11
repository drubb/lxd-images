#!/bin/sh

# Exit the script if any command fails
set -e

# Wait for the network being available
rc-service networking start

# Install React cli
npm -g install ember-cli

# Cleanup
npm -g cache clean --force