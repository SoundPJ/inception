FROM debian:bullseye

# Install
RUN apt update && apt -y upgrade
RUN apt install nginx -y
RUN apt install openssl -y
RUN apt-get install -y php php-mysql php-fpm

# Create TLS certificate
RUN openssl req -nodes -x509 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -days 365 -subj "/C=TH/ST=Bangkok/O=42/CN=pjerddee.42.fr"

# Copy config file to the container
COPY ./conf/nginx.conf /etc/nginx/sites-available/default

# Expose port 9000 to communicate with wordpress, port 443 to communicate with host
EXPOSE 9000
EXPOSE 443

# To run the container in foreground
CMD nginx -g 'daemon off;'
