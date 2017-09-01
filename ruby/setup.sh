#!/bin/sh

# Exit the script if any command fails
set -e

# Wait for the network being available
rc-service networking start

# Get Ruby and some required tools / libraries
apk --update add build-base ruby ruby-dev ruby-rdoc ruby-irb libffi-dev libxml2-dev libxslt-dev zlib-dev
gem install -N nokogiri -- --use-system-libraries


# Cleanup
rm -rf /var/cache/apk/* /tmp/*