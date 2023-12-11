FROM debian:bullseye

RUN apt update && apt -y upgrade

RUN apt install nginx -y

RUN apt install openssl -y

RUN openssl req -nodes -x509 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -days 365 -subj "/C=TH/ST=Bangkok/O=42/CN=pjerddee.42.fr"

# COPY ./conf/nginx.conf .

COPY ./conf/nginx.conf /etc/nginx/sites-available/

CMD service nginx start && nginx -g daemon off;