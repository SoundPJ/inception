FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y php php-fpm php-mysql curl wget

# RUN apt-get install php7.2 php7.2-cli php7.2-fpm php7.2-mysql php7.2-json php7.2-opcache php7.2-mbstring php7.2-xml php7.2-gd php7.2-curl
# RUN apt-get install -y php php-mysql php-fpm php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip
RUN		apt -y install curl \
		vim telnet \
		mariadb-client \
		redis-server \
		php \
		php-common \
		php-cli \
		php-fpm \
		php-json \
		php-pdo \
		php-mysql \
		php-zip \
		php-gd \
		php-mbstring \
		php-curl \
		php-xml \
		php-pear \
		php-bcmath;

COPY ./test.sh .

RUN chmod +x test.sh

RUN mkdir -p /run/php

RUN chown -R www-data:www-data /run/php

COPY ./www.conf /etc/php/7.4/fpm/pool.d

# CMD [ "php-fpm7.4", "-F" ]

CMD ["bash", "test.sh"]
# CMD [ "sleep", "infinity" ]

