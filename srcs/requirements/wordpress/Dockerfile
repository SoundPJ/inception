FROM debian:bullseye

RUN apt update -y && apt upgrade -y

RUN apt install -y php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp-cli

RUN wp-cli core download --allow-root

# RUN wp-cli config create --dbname=$DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --locale=en_DB --allow-root

RUN wp-cli core install --url=$DOMAIN_NAME --title=$BLOG_TITLE --admin_user=$MYSQL_ADMIN --admin_password=$MYSQL_ADMIN_PASSWORD --allow-root

CMD [ "sleep", "infinity" ]

