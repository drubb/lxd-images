#!/bin/sh

set -e

#
# LXD images recipe: PhpMyAdmin
#
# Dependencies: Composer
#
# Environment variables:
#
# - DBUSER - database user, e.g. 'drupal', default 'root'
# - DBPASS - database password, e.g. 'drupal', default ''
#

installPhpMyAdmin() {

# Fetch the variables
DBUSER=${DBUSER:-"root"}
DBPASS=${DBPASS:-""}

# Check the dependencies
command -v composer > /dev/null || (echo "installPhpMyAdmin recipe requires Composer, missing"; exit 1)

# Install PhpMyAdmin
composer create-project --no-dev --prefer-dist phpmyadmin/phpmyadmin /opt/phpmyadmin

# Add PhpMyAdmin configuration file
cp /config/phpmyadmin /opt/phpmyadmin/config.inc.php
sed -i "s|youruser|${DBUSER}|g" /opt/phpmyadmin/config.inc.php
sed -i "s|yourpass|${DBPASS}|g" /opt/phpmyadmin/config.inc.php

}
