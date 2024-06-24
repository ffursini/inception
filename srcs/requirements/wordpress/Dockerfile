FROM alpine:3.19

RUN apk update && apk add php php-cgi php-fpm php-mysqli php-mbstring php-gd php-cli php-phar

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp && chmod +x /usr/local/bin/wp

COPY ./conf/www.conf /etc/php82/php-fpm.d/www.conf

COPY ./tools/init_wp.sh /usr/local/bin/init_wp.sh
RUN chmod +x /usr/local/bin/init_wp.sh
ENTRYPOINT [ "/usr/local/bin/init_wp.sh" ]

WORKDIR /var/www/html

EXPOSE 9000

CMD ["php-fpm82", "-F"]
