#!/bin/sh

set -ex

#
# LXD images recipe: Java 8 runtime environment
#
# Dependencies: none
#
# Environment variables:
#
# - none
#

installJavaJRE() {

# Install Java 8 RE
apk --update add openjdk8-jre

}
