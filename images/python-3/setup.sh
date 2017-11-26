#!/bin/sh

#
# LXD images setup script: Python 3 development environment
#
# This script is used inside the container to setup the required environment
#

# Add a container description that can be used during the build process
echo "Python 3 development environment" > /.container

# Fetch the recipes collection
source /recipes.sh

# Add variables used in recipes, where applicable
# TIMEZONE=${TIMEZONE:-"Europe/Berlin"}

# Build the container using several recipes
waitNetwork
installBase
installPython3
cleanup