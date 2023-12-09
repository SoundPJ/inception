FROM debian:bullseye

RUN apt update -y && apt upgrade -y

RUN apt install -y php php-fpm php-mysql curl wget

RUN mkdir -p public_html/blogdemo

RUN cd public_html/blogdemo

RUN wget http://wordpress.org/latest.tar.gz

RUN tar xfz latest.tar.gz

RUN mv wordpress/* ./

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp-cli

COPY ./test.sh .

RUN chmod +x test.sh

# RUN wp-cli config create --dbname=$DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$HOST_NAME --locale=en_DB --allow-root
# RUN wp-cli config create --dbname="WordPress" --dbuser="master" --dbpass="master_password" --dbhost="mariadbd" --locale=en_DB --allow-root

# RUN wp-cli core install --url=$DOMAIN_NAME --title=$BLOG_TITLE --admin_user=$MYSQL_ADMIN --admin_password=$MYSQL_ADMIN_PASSWORD --admin_email=$MYSQL_ADMIN_EMAIL --allow-root
# RUN wp-cli core install --url="pjerddee.42.fr" --title="Inception" --admin_user="master" --admin_password="master_password" --admin_email="master@42.fr" --allow-root

RUN mkdir -p /run/php

RUN chown -R www-data:www-data /run/php

# CMD [ "php-fpm7.4", "-F" ]

CMD ["bash", "test.sh"]
# CMD [ "sleep", "infinity" ]

