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
lxc file push mysql.cnf ${CONTAINER}/root/.my.cnf
lxc exec ${CONTAINER} sh /root/setup.sh
lxc exec ${CONTAINER} rm /root/setup.sh

# Add several configuration files to the container
lxc file push nginx.conf ${CONTAINER}/etc/nginx/conf.d/default.conf
lxc file push php.ini ${CONTAINER}/etc/php7/conf.d/php.ini
lxc file push php-fpm.conf ${CONTAINER}/etc/php7/php-fpm.conf
lxc file push ssmtp.conf ${CONTAINER}/etc/ssmtp/ssmtp.conf

# Publish the container as image and delete it
lxc image delete ${CONTAINER} 2> /dev/null || true
lxc publish ${CONTAINER} -f --alias=${CONTAINER} description="Drupal 8 development environment"
lxc delete ${CONTAINER} -f