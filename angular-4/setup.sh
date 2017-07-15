#!/bin/sh

# Exit the script if any command fails
set -e

# Wait for the network being available
rc-service networking start

# Install angular cli
npm -g install npm @angular/cli

# Make the angular server accessible from the host // TODO: needs disable-host-check, too
ng set defaults.serve.host 0.0.0.0 -g