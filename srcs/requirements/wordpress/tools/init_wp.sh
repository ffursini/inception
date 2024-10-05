#!/bin/sh

if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else
	curl -O https://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress

	sed -i "s/username_here/$MYSQL_ADMIN/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php
fi

exec "$@"

# Description:
# This script initializes WordPress in the container. It checks if WordPress
# is already installed, and if not, it downloads the latest version, extracts it,
# and sets up the wp-config.php file with the correct database credentials.
# The script uses environment variables to configure WordPress, allowing for
# easy customization of the setup.
