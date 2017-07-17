#!/bin/sh

# Exit the script if any command fails
set -e

# Wait for the network being available
rc-service networking start

# Add Python 2, it's a requirement for some angular stuff
apk update && apk upgrade
apk add python2

# Install angular cli
npm -g install @angular/cli --unsafe-perm

# Make the angular server accessible from the host // TODO: needs disable-host-check, too
ng set defaults.serve.host 0.0.0.0 -g