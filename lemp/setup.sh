#!/bin/sh

# Exit the script if any command fails
set -e

# Wait for the network being available
rc-service networking start

# Install web server, database and php
apk update && apk upgrade
apk add nginx mariadb mariadb-client php7 php7-fpm ssmtp
/etc/init.d/mariadb setup
rc-service mariadb start
mysql -e "CREATE USER 'root'@'%' IDENTIFIED BY '';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '' WITH GRANT OPTION;"
mysql -e "DROP DATABASE test; DELETE FROM mysql.user WHERE Host <> '%'; FLUSH PRIVILEGES;"

# Install additional php extensions required by various apps
apk add php7-intl php7-openssl php7-pdo_mysql php7-pdo_sqlite php7-opcache \
        php7-gd php7-json php7-xml php7-curl php7-phar php7-xdebug php7-zip php7-ctype \
        php7-mcrypt php7-bcmath php7-zlib php7-dom php7-pcntl php7-iconv php7-posix \
        php7-mbstring php7-session php7-simplexml php7-tokenizer php7-soap

# Add a symbolic link for the php cli binary
ln -sf /usr/bin/php7 /usr/bin/php

# PHP-FPM should run daemonized, using the root user
sed -i -e 's/--nodaemonize/-R/g' /etc/init.d/php-fpm7

# Configure upstart
rc-update add nginx
rc-update add mariadb
rc-update add php-fpm7

# Add Composer
curl -o /usr/local/bin/composer https://getcomposer.org/composer.phar
chmod +x /usr/local/bin/composer

# Cleanup
rm -rf /var/www/localhost /var/cache/apk/* /tmp/*
mkdir -p /var/www/html
