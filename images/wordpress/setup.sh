#!/bin/sh

#
# LXD images setup script: Wordpress development environment
#
# This script is used inside the container to setup the required environment
#

# Add a container description that can be used during the build process
echo "Wordpress development environment" > /.container

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
installWPCli
cleanup
