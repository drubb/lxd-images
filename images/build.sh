#!/bin/sh

# Exit the script if any command fails
set -ex

# Get the container name (default: current directory)
CONTAINER=${1:-${PWD##*/}}

# Create a container using alpine 3.6
lxc launch images:alpine/3.6/amd64 ${CONTAINER}

# Copy recipes and configuration files to the container
lxc file push -rp ../../config/* ${CONTAINER}/config
lxc file push -rp ../../recipes/*.sh ${CONTAINER}/recipes
lxc file push ../recipes.sh ${CONTAINER}/recipes.sh
lxc file push ../../.env ${CONTAINER}/.env

# Copy and run the setup script inside the container
lxc file push setup.sh ${CONTAINER}/setup.sh
lxc exec ${CONTAINER} -- sh /setup.sh

# Cleanup setup stuff
lxc exec ${CONTAINER} -- rm -rf /setup.sh /recipes.sh /.env /recipes /config

# Fetch the container description and pass it to a variable
lxc file pull ${CONTAINER}/.container .
DESCRIPTION=$(cat ./.container)
rm ./.container

# Publish the container as image and delete it
lxc image delete ${CONTAINER} 2> /dev/null || true
lxc publish ${CONTAINER} -f --alias=${CONTAINER} description="${DESCRIPTION}"
lxc delete ${CONTAINER} -f
