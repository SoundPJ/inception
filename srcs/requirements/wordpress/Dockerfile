FROM debian:bullseye

RUN apt update -y && apt upgrade -y

RUN apt install -y php php-fpm php-mysql curl wget

COPY ./test.sh .

RUN chmod +x test.sh

RUN mkdir -p /run/php

RUN chown -R www-data:www-data /run/php

# CMD [ "php-fpm7.4", "-F" ]

CMD ["bash", "test.sh"]
# CMD [ "sleep", "infinity" ]

