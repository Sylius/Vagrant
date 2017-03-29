#!/bin/bash

cd /var/www/sylius

rm .gitkeep

composer create-project -s beta -n sylius/sylius-standard .

sed -i "s/database_password: null/database_password: vagrant/g" app/config/parameters.yml

php bin/console sylius:install --no-interaction
php bin/console sylius:fixtures:load
npm install
npm run gulp

cd ../
git update-index --assume-unchanged sylius/.gitkeep
