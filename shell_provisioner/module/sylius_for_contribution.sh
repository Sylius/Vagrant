#!/bin/bash

cd /var/www/sites/sylius

composer install
sed -i "s/database_password: null/database_password: vagrant/g" app/config/parameters.yml

php bin/console sylius:install --no-interaction
php bin/console sylius:fixtures:load
yarn install
yarn run gulp
