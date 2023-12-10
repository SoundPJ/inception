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

RUN mkdir -p /run/php

RUN chown -R www-data:www-data /run/php

# CMD [ "php-fpm7.4", "-F" ]

CMD ["bash", "test.sh"]
# CMD [ "sleep", "infinity" ]

