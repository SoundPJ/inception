#!/bin/bash

# Database credentials
MYSQL_ROOT_USER="root"
MYSQL_ROOT_PASSWORD="root_password"
MYSQL_USER="user"
MYSQL_PASSWORD="user_password"
MYSQL_ADMIN="master"
MYSQL_ADMIN_PASSWORD="master_password"
DB_NAME="WordPress"

service mariadb restart

# Create user and grant privileges
mysql -u $MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD << EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$MYSQL_ADMIN'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_ADMIN'@'%';
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT INSERT, UPDATE, DELETE, CREATE, ALTER, INDEX, EXECUTE ON $DB_NAME.* TO '$MYSQL_USER'@'%';
GRANT SHOW DATABASES ON *.* TO '$MYSQL_USER'@'%';
GRANT USAGE ON *.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOF

# chmod 777 /var/lib/mysql
# chown -R mysql:mysql /var/run/mysqld
# chmod 777 /var/run/mysqld

# chown -R mys:root /var/lib/mysql

