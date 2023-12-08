FROM debian:bullseye

RUN apt update && apt -y upgrade

RUN apt install nginx -y

RUN apt install openssl -y

CMD service nginx start && sleep infinity