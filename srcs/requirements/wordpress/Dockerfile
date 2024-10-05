# Dockerfile for Wordpress container

# Use Alpine Linux 3.19 as the base image
FROM alpine:3.19

# Install PHP and necessary extensions
RUN apk update && apk add php php-cgi php-fpm php-mysqli php-mbstring php-gd php-cli php-phar curl

# Install WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp && chmod +x /usr/local/bin/wp

# Copy PHP-FPM configuration
COPY ./conf/www.conf /etc/php82/php-fpm.d/www.conf

# Copy and set permissions for WordPress initialization script
COPY ./tools/init_wp.sh /usr/local/bin/init_wp.sh
RUN chmod +x /usr/local/bin/init_wp.sh

# Set entrypoint
ENTRYPOINT [ "/usr/local/bin/init_wp.sh" ]

# Set working directory
WORKDIR /var/www/html

# Expose port for PHP-FPM
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm82", "-F"]

# Description:
# This Dockerfile sets up a container for running WordPress with PHP-FPM.
# It installs PHP and necessary extensions, WP-CLI for WordPress management,
# and sets up the initialization script. The container uses PHP-FPM to handle
# PHP processing and exposes port 9000 for communication with the web server.
