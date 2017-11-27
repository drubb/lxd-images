#!/bin/sh

#
# LXD images setup script: Drupal 7
#
# This script is used inside the container to setup the required environment
#


# Add a container description that can be used during the build process
echo "Drupal 7 development environment" > /.container

# Fetch the recipes collection
source /recipes.sh

# Add variables used in recipes, where applicable
# WEBROOT=${WEBROOT:-"/var/www/html"}

# Build the container using several recipes
waitNetwork
installBase
installNginx
installMariaDB
installPhp7
installComposer
installPhpMyAdmin
installSsmtp
installDrush
cleanup
