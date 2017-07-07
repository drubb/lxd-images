#!/bin/sh

# Exit the script if any command fails
set -e

# Wait for the network being available
rc-service networking start

# Install some basic tools needed inside the container
apk update && apk upgrade
apk add tzdata
cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime
echo "Europe/Berlin" > /etc/timezone
apk del tzdata
apk add curl wget git mc nano openssh-client shadow

# Add zsh / oh-my-zsh and make it the default shell
apk add zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
sed -i -e 's/ash/zsh/g' /etc/passwd

# Add node.js and angular cli
apk add nodejs
npm -g install npm @angular/cli

# Make the angular server accessible from the host, without port // TODO: needs disable-host-check, too
ng set defaults.serve.host 0.0.0.0 -g
ng set defaults.serve.port 80 -g

# Add a dummy .ssh folder to prevent ssh-agent complaints
mkdir ~/.ssh

# Cleanup
rm -rf /var/cache/apk/* /tmp/*