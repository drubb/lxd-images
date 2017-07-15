#!/bin/sh

# Exit the script if any command fails
set -e

# Wait for the network being available
rc-service networking start

# Install web server, database and php
apk update && apk upgrade
apk add nginx mariadb mariadb-client php5 php5-fpm
/etc/init.d/mariadb setup -q
rc-service mariadb start
mysql -e "CREATE USER 'root'@'%' IDENTIFIED BY '';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '' WITH GRANT OPTION;"
mysql -e "DROP DATABASE test; DELETE FROM mysql.user WHERE Host <> '%'; FLUSH PRIVILEGES;"

# Install additional php extensions required by Drupal or some cli tools
apk add php5-intl php5-openssl php5-pdo_mysql php5-pdo_sqlite php5-opcache \
        php5-gd php5-json php5-xml php5-curl php5-phar php5-xdebug php5-zip php5-ctype \
        php5-mcrypt php5-bcmath php5-zlib php5-dom php5-pcntl php5-iconv php5-posix

# PHP-FPM should run daemonized, using the root user
sed -i -e 's/--nodaemonize/-R/g' /etc/init.d/php-fpm

# Configure upstart
rc-update add nginx
rc-update add mariadb
rc-update add php-fpm

# Add Drush
curl -o /usr/local/bin/drush https://s3.amazonaws.com/files.drush.org/drush.phar
chmod +x /usr/local/bin/drush

# Cleanup
rm -rf /var/www/localhost /var/cache/apk/* /tmp/*
mkdir -p /var/www/html
