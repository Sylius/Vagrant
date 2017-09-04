#!/bin/bash

# Install node.js
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
apt-get install -y nodejs

# Update node packaged modules
npm update -g npm