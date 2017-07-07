#!/bin/sh

# Exit the script if any command fails
set -e

# Get the container name (default: current directory)
CONTAINER=${1:-${PWD##*/}}

# Create a container using alpine
lxc launch images:alpine/3.5/amd64 ${CONTAINER}

# Copy and run the setup script
lxc file push setup.sh ${CONTAINER}/root/setup.sh
lxc file push .zshrc ${CONTAINER}/root/.zshrc
lxc exec ${CONTAINER} sh /root/setup.sh
lxc exec ${CONTAINER} rm /root/setup.sh

# Publish the container as image and delete it
lxc image delete ${CONTAINER} 2> /dev/null || true
lxc publish ${CONTAINER} -f --alias=${CONTAINER} description="Python 2 development environment"
lxc delete ${CONTAINER} -f