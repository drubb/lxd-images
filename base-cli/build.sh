#!/bin/sh

# Exit the script if any command fails
set -e

# The container name is fixed, as it's reused
CONTAINER="base-cli"

# Create a container using alpine 3.5
lxc launch images:alpine/3.5/amd64 ${CONTAINER}

# Add zsh configuration
lxc file push .zshrc ${CONTAINER}/root/.zshrc

# Copy, run and remove the setup script
lxc file push setup.sh ${CONTAINER}/root/setup.sh
lxc exec ${CONTAINER} sh /root/setup.sh
lxc exec ${CONTAINER} rm /root/setup.sh

# Publish the container as image and delete it
lxc image delete ${CONTAINER} 2> /dev/null || true
lxc publish ${CONTAINER} -f --alias=${CONTAINER} description="Basic cli container for development environments"
lxc delete ${CONTAINER} -f