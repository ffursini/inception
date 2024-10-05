#!/bin/sh

# Install MariaDB
mysql_install_db

# Wait for MariaDB to be ready
sleep 5

# Start MariaDB in safe mode
/usr/bin/mysqld_safe &

# Wait for MariaDB to start
sleep 5

# Check if the database already exists
if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then
	echo "Database already exists"
else
	# Secure the MariaDB installation
	mysql_secure_installation << EOF

	Y
	Y
	$MYSQL_ROOT_PASSWORD
	$MYSQL_ROOT_PASSWORD
	Y
	n
	Y
	Y
EOF

	# Set up root user and create the database
	echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot
	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_ADMIN'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -u root
	mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/wordpress.sql
fi

# Shutdown MariaDB
mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown

# Execute the passed command
exec "$@"

# Description:
# This script initializes the MariaDB database for WordPress.
# It sets up the database if it doesn't exist, secures the installation,
# creates necessary users and permissions, and imports the initial WordPress
# database structure. The script is designed to run when the container starts.
