FROM debian:bullseye

RUN apt update && apt -y upgrade

RUN apt install nginx -y

RUN apt install openssl -y

RUN apt-get install -y php php-mysql php-fpm

RUN openssl req -nodes -x509 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -days 365 -subj "/C=TH/ST=Bangkok/O=42/CN=pjerddee.42.fr"

COPY ./conf/nginx.conf /etc/nginx/sites-available/default

CMD nginx -g 'daemon off;'
