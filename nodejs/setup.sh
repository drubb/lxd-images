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

# Add Node.js and build tools
apk add build-base nodejs
npm -g install npm

# Add a dummy .ssh folder to prevent ssh-agent complaints
mkdir ~/.ssh

# Cleanup
rm -rf /var/cache/apk/* /tmp/*