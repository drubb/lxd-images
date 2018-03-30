#!/bin/sh

set -e

#
# LXD images recipe: SSMTP MTA
#
# Dependencies: none
#
# Environment variables:
#
# - MAILSERV - the smtp server, including port, e.g. mail.example.com:587
# - MAILUSER - the user name for login, e.g. 'user'
# - MAILPASS - the password for login, e.g. 'password'
# - MAILADDR - the email address for the root user, e.g. admin@example.com
#

installSsmtp() {

# Check the variables
MAILSERV=${MAILSERV:-mail.example.com}
MAILUSER=${MAILUSER:-user}
MAILPASS=${MAILPASS:-password}
MAILADDR=${MAILADDR:-admin@example.com}

# Install ssmtp package
apk --update add ssmtp

# Copy the configuration file
cp /config/ssmtp /etc/ssmtp/ssmtp.conf

# Replace the credentials for the smtp server
sed -i "s/^mailhub=.*/mailhub=${MAILSERV}/g" /etc/ssmtp/ssmtp.conf
sed -i "s/^AuthUser=.*/AuthUser=${MAILUSER}/g" /etc/ssmtp/ssmtp.conf
sed -i "s/^AuthPass=.*/AuthUser=${MAILPASS}/g" /etc/ssmtp/ssmtp.conf
sed -i "s/^root=.*/root=${MAILADDR}/g" /etc/ssmtp/ssmtp.conf

}
