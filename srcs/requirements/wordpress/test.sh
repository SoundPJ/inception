#!/bin/bash

wp-cli config create --dbname=$DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$HOST_NAME --locale=en_DB --allow-root

wp-cli core install --url=$DOMAIN_NAME --title=$BLOG_TITLE --admin_user=$MYSQL_ADMIN --admin_password=$MYSQL_ADMIN_PASSWORD --admin_email=$MYSQL_ADMIN_EMAIL --allow-root

echo $DB_NAME

php-fpm7.4 -F