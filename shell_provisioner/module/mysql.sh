#!/bin/bash

# Configuration
sed -i "s/\[mysqld\]/[mysqld]\ninnodb_file_per_table = 1/" /etc/mysql/my.cnf
sed -i 's/bind-address.*/bind-address\t\t= 0.0.0.0/' /etc/mysql/my.cnf
service mysql restart

# Add database
MYSQLCMD="mysql -uroot -e"
$MYSQLCMD "CREATE DATABASE ${APP_DBNAME} DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;"

$MYSQLCMD "CREATE USER root@'10.0.0.1' IDENTIFIED BY 'vagrant';"
$MYSQLCMD "GRANT ALL PRIVILEGES ON *.* TO root@'10.0.0.1';"

$MYSQLCMD "FLUSH PRIVILEGES;"