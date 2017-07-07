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

# Add Python 3 and build tools
apk add build-base python3-dev

# Create symlinks for python and pip
ln -s /usr/bin/python3 /usr/bin/python
ln -s /usr/bin/pip3 /usr/bin/pip

# Add a dummy .ssh folder to prevent ssh-agent complaints
mkdir ~/.ssh

# Cleanup
rm -rf /var/www/localhost /var/cache/apk/* /tmp/*