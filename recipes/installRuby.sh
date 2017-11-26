#!/bin/sh

set -ex

#
# LXD images recipe: Ruby
#
# Dependencies: none
#
# Environment variables:
#
# - none
#

installRuby() {

# Install ruby development packages
apk --update add build-base ruby ruby-dev ruby-rdoc ruby-irb libffi-dev libxml2-dev libxslt-dev zlib-dev
gem install -N nokogiri -- --use-system-libraries

}
