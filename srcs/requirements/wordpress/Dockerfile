FROM debian:bullseye

# Install
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y php php-fpm php-mysql wget curl

# Copy script to the container
COPY ./tools/wordpress_script.sh .
RUN chmod +x wordpress_script.sh

# For running php-fpm7.4
RUN mkdir -p /run/php
RUN chown -R www-data:www-data /run/php

# Copy config file to the container
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d

# Export port 3306 to communicate with mariadb, port 9000 to communicate with nginx
EXPOSE 3306
EXPOSE 9000

# To run the script
CMD ["bash", "wordpress_script.sh"]