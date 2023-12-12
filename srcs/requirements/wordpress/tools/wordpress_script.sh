#!/bin/bash

# Create a folder for wordpress data
mkdir -p public_html/blogdemo
cd public_html/blogdemo

# Download wordpress template
wget http://wordpress.org/latest.tar.gz
tar xfz latest.tar.gz
mv wordpress/* ./
rmdir ./wordpress/
rm -f latest.tar.gz

# Download command line interface for wordpress
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp-cli

wp-cli core download --allow-root

# Create wordpress config file
wp-cli config create --dbname=$DB_NAME --dbuser=$MYSQL_ADMIN --dbpass=$MYSQL_ADMIN_PASSWORD --dbhost=$HOST_NAME --locale=en_DB --allow-root

# Install wordpress
wp-cli core install --url=$DOMAIN_NAME --title=$BLOG_TITLE --admin_user=$MYSQL_ADMIN --admin_password=$MYSQL_ADMIN_PASSWORD --admin_email=$MYSQL_ADMIN_EMAIL --allow-root

chown -R www-data:www-data /public_html/blogdemo/
chmod -R 755 /public_html/blogdemo/

# Run php-fpm7.4 in foreground and allow run as root
php-fpm7.4 -F -R
