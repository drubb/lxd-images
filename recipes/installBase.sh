#!/bin/sh

set -ex

#
# LXD images recipe: Basic CLI
#
# Dependencies: none
#
# Environment variables:
#
# - TIMEZONE: timezone, e.g. 'Europe/Berlin', default 'UTC'
# - ZSHTHEME: theme for oh-my-zsh, default 'essembeh'
#

installBase() {
TIMEZONE=${TIMEZONE:-UTC}
ZSHTHEME=${ZSHTHEME:-essembeh}

apk --update add curl wget git mc nano openssh-client shadow rsync tzdata zsh nodejs-npm
cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime
echo ${TIMEZONE} > /etc/timezone
apk del tzdata
git clone --depth=1 git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
sed -i 's/ash/zsh/g' /etc/passwd
npm -g install npm
mkdir ~/.ssh
touch ~/.z
cp /config/zsh /root/.zshrc
sed -i "s|ZSH_THEME=essembeh|ZSH_THEME=$ZSHTHEME|g" /root/.zshrc
}
