# Using the penultimate stable version of Debian
FROM debian:11

RUN apt-get update && apt-get upgrade

RUN apt-get install -y apache2 php libapache2-mod-php php-mysql unzip wget

# Download and install WordPress
WORKDIR /var/www/html
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz --strip-components=1 && \
    rm latest.tar.gz

# Set environment variables
ENV WORDPRESS_DB_HOST=mariadbd
ENV WORDPRESS_DB_USER=your_db_user
ENV WORDPRESS_DB_PASSWORD=your_db_password
ENV WORDPRESS_DB_NAME=your_db_name

# Set up Apache configurations
RUN a2enmod rewrite && \
    chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

RUN tar -xzvf /tmp/wordpress.tar.gz -C /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["apache2ctl", "-D", "FOREGROUND"]