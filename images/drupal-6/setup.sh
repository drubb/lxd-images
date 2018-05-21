#!/bin/sh

#
# LXD images setup script: Drupal 6
#
# This script is used inside the container to setup the required environment
#


# Add a container description that can be used during the build process
echo "Drupal 6 development environment" > /.container

# Fetch the recipes collection
source /recipes.sh

# Add variables used in recipes, where applicable
# WEBROOT=${WEBROOT:-"/var/www/html"}

# Build the container using several recipes
waitNetwork
installBase
installNginx
installMariaDB
installPhp5
installComposer
installPhpMyAdmin
installSsmtp
installDrush
cleanup
