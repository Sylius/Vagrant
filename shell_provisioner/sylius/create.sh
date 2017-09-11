#!/bin/bash

cd /var/www/sites

composer create-project --no-progress -s beta -n sylius/sylius-standard ./sylius
