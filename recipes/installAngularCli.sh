#!/bin/sh

set -e

#
# LXD images recipe: Angular CLI
#
# Dependencies: npm
#
# Environment variables:
#
# - none
#

installAngularCli() {
command -v npm > /dev/null || (echo "installAngularCli recipe requires npm, missing"; exit 1)
npm -g install @angular/cli --unsafe-perm
ng set defaults.serve.host 0.0.0.0 -g
}
