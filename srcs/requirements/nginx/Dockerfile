# Dockerfile for Nginx container

# Use Alpine Linux 3.19 as the base image
FROM alpine:3.19

# Update repositories and install nginx and openssl
RUN apk update && apk add nginx openssl

# Create directory for SSL certificates
RUN mkdir -p /etc/nginx/ssl

# Generate a self-signed SSL certificate using openssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out /etc/nginx/ssl/fursini.crt \
    -keyout /etc/nginx/ssl/fursini.key \
    -subj "/C=IT/ST=Rome/L=Rome/O=42 Roma Luiss/OU=fursini/CN=fursini"

# Copy the custom nginx configuration file to the nginx configuration directory
COPY ./conf/default.conf /etc/nginx/http.d/default.conf

# Expose port 443 for HTTPS connections
EXPOSE 443

# Start nginx in non-daemon mode
CMD ["nginx", "-g", "daemon off;"]

# Description:
# This Dockerfile sets up an Nginx container based on Alpine Linux.
# It installs Nginx and OpenSSL, generates a self-signed SSL certificate,
# and configures Nginx to use HTTPS. The container exposes port 443 for
# secure connections and uses a custom Nginx configuration.
