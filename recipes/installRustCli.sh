#!/bin/sh

set -ex

#
# LXD images recipe: Rust
#
# Dependencies: none
#
# Environment variables:
#
# - none
#

installRustCli() {

# Install Rust and Cargo.
apk --update add rust cargo

}
