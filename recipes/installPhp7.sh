#!/bin/sh

set -ex

#
# LXD images recipe: PHP 7
#
# Dependencies: none
#
# Environment variables:
#
# - TIMEZONE - timezone, e.g. 'Europe/Berlin', default 'UTC'
#

installPhp7() {
TIMEZONE=${TIMEZONE:-UTC}
apk --update add php7 php7-fpm
apk add php7-intl php7-openssl php7-pdo_mysql php7-pdo_sqlite php7-opcache \
        php7-gd php7-json php7-xml php7-curl php7-phar php7-xdebug php7-zip php7-ctype \
        php7-mcrypt php7-bcmath php7-zlib php7-dom php7-pcntl php7-iconv php7-posix \
        php7-mbstring php7-session php7-simplexml php7-tokenizer php7-soap php7-xmlwriter
ln -sf /usr/bin/php7 /usr/bin/php
sed -i 's/--nodaemonize/-R/g' /etc/init.d/php-fpm7
rc-update add php-fpm7
cp /config/php /etc/php7/conf.d/php.ini
sed -i "s|date.timezone=UTC|date.timezone=${TIMEZONE}|g" /etc/php7/conf.d/php.ini
cp /config/php-fpm /etc/php7/php-fpm.conf
}
