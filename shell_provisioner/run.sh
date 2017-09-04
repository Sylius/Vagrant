#!/bin/bash

apt-get -y update

apt-get remove php* apache2*

# Shell provisioner
MODULE_PATH='/vagrant/shell_provisioner/module'
CONFIG_PATH='/vagrant/shell_provisioner/config'

# IP for the vagrant VM
GUEST_IP='10.0.0.200'

#Config
APP_DOMAIN='sylius.dev'
APP_DBNAME='sylius'

# Adding an entry here executes the corresponding .sh file in MODULE_PATH
DEPENDENCIES=(
    tools
    php
    mysql
    apache
    node
    yarn
)

for MODULE in ${DEPENDENCIES[@]}; do
    source ${MODULE_PATH}/${MODULE}.sh
done
