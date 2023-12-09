FROM debian:bullseye

RUN apt update && apt -y upgrade

RUN apt install nginx -y

RUN apt install openssl -y

RUN openssl req -nodes -x509 -newkey rsa:4096 -keyout private.key -out server.crt -days 365 -subj "/C=TH/ST=Bangkok/O=42Bangkok/CN=pjerddee.42.fr"

COPY $(PWD)/conf/nginx.conf .

CMD service nginx start && bash