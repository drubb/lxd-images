#!/bin/sh

set -ex

#
# LXD images recipe: Nginx
#
# Dependencies: none
#
# Environment variables:
#
# - WEBROOT - web root, e.g. '/var/www/html/web', default '/var/www/html'
#

installNginx() {
WEBROOT=${WEBROOT:-/var/www/html}
apk --update add nginx
rc-update add nginx
rm -rf /var/www/localhost
mkdir -p ${WEBROOT}
cp /config/nginx /etc/nginx/conf.d/default.conf
sed -i "s|root /var/www/html|root $WEBROOT|g" /etc/nginx/conf.d/default.conf
}
