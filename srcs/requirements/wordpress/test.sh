#!/bin/bash

wp-cli config create --dbname="WordPress" --dbuser="master" --dbpass="master_password" --dbhost="mariadbd" --locale=en_DB --allow-root

wp-cli core install --url="pjerddee.42.fr" --title="Inception" --admin_user="master" --admin_password="master_password" --admin_email="master@42.fr" --allow-root

php-fpm7.4 -F