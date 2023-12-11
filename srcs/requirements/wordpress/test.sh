#!/bin/bash

mkdir -p public_html/blogdemo

cd public_html/blogdemo

wget http://wordpress.org/latest.tar.gz

tar xfz latest.tar.gz

mv wordpress/* ./

rmdir ./wordpress/

rm -f latest.tar.gz

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp-cli

wp-cli config create --dbname=$DB_NAME --dbuser=$MYSQL_ADMIN --dbpass=$MYSQL_ADMIN_PASSWORD --dbhost=$HOST_NAME --locale=en_DB --allow-root

echo hello

echo $MYSQL_ADMIN_EMAIL

echo hello

wp-cli core install --url=$DOMAIN_NAME --title=$BLOG_TITLE --admin_user=$MYSQL_ADMIN --admin_password=$MYSQL_ADMIN_PASSWORD --admin_email=$MYSQL_ADMIN_EMAIL --allow-root

chown -R www-data:www-data /public_html/blogdemo/
chmod -R 755 /public_html/blogdemo/

php-fpm7.4 -F -R
