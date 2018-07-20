#!/bin/sh

set -e

#
# LXD images recipe: PHP 5
#
# Dependencies: none
#
# Environment variables:
#
# - TIMEZONE - timezone, e.g. 'Europe/Berlin', default 'UTC'
#

installPhp5() {
TIMEZONE=${TIMEZONE:-UTC}
echo 'http://dl-cdn.alpinelinux.org/alpine/v3.5/community' >> /etc/apk/repositories
apk --update add php5 php5-fpm
apk add php5-intl php5-openssl php5-mysql php5-mysqli php5-pdo_mysql php5-pdo_sqlite php5-opcache \
        php5-gd php5-json php5-xml php5-curl php5-phar php5-zip php5-ctype php5-ftp \
        php5-mcrypt php5-bcmath php5-zlib php5-dom php5-pcntl php5-iconv php5-posix php5-apcu \
        php5-soap php5-xdebug
ln -sf /usr/bin/php5 /usr/bin/php
sed -i 's/--nodaemonize/-R/g' /etc/init.d/php-fpm
rc-update add php-fpm
cp /config/php /etc/php5/conf.d/php.ini
sed -i "s|date.timezone=UTC|date.timezone=${TIMEZONE}|g" /etc/php5/conf.d/php.ini
cp /config/php-fpm /etc/php5/php-fpm.conf
}
