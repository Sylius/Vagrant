#!/bin/bash

cd /var/www/sites/sylius

sed -i "s/database_password: '%env(SYLIUS_DATABASE_PASSWORD)%'/database_password: vagrant/g" app/config/parameters.yml

php bin/console sylius:install --no-interaction
php bin/console sylius:fixtures:load
yarn install
yarn run gulp
