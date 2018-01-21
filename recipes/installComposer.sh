#!/bin/sh

set -ex

#
# LXD images recipe: Composer
#
# Dependencies: curl, php, zsh
#
# Environment variables:
#
# - none
#

installComposer() {

# Check the dependencies
command -v curl > /dev/null || (echo "installComposer recipe requires curl, missing"; exit 1)
command -v php > /dev/null || (echo "installComposer recipe requires php, missing"; exit 1)
command -v zsh > /dev/null || (echo "installComposer recipe requires zsh, missing"; exit 1)

# Install Composer
curl -o /usr/local/bin/composer https://getcomposer.org/composer.phar
chmod +x /usr/local/bin/composer

# Add binaries to path and prevent Composer warning about root user / xdebug
export PATH="$PATH:/root/.composer/vendor/bin"
export COMPOSER_ALLOW_SUPERUSER=1
export COMPOSER_DISABLE_XDEBUG_WARN=1

# Downgrade from latest to stable release
composer selfupdate
rm /root/.composer/*.phar

# Add some default configuration
composer global config minimum-stability dev
composer global config prefer-stable true

cat >> /root/.zsh-additions << "EOF"
export PATH="$PATH:/root/.composer/vendor/bin"
export COMPOSER_ALLOW_SUPERUSER=1
export COMPOSER_DISABLE_XDEBUG_WARN=1
alias composer='noglob composer'
alias cgr='noglob cgr'
source /root/.composer/completion
EOF
composer --update-no-dev global require consolidation/cgr
cgr --update-no-dev bamarni/symfony-console-autocomplete hirak/prestissimo
symfony-autocomplete composer --shell zsh > /root/.composer/completion
}
