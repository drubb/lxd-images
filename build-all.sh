#!/bin/sh

# Exit the script if any command fails
set -e

# Build the base image
cd base-cli && sh build.sh && cd ..

# Build all derived images
find . -maxdepth 1 -type d -not -name "base-cli" \( ! -name . \) -exec sh -c "cd '{}' && sh build.sh" \;
