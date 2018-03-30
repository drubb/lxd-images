#!/bin/sh

set -e

#
# LXD images script: Fetch recipes and environment
#

# Fetch the environment variables
source /.env

# Fetch the recipes
for file in ../recipes/*.sh ; do
  if [ -f "$file" ] ; then
    source "$file"
  fi
done