FROM alpine:3.19

RUN apk update && apk add mariadb mariadb-client

RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql && chmod 777 /var/lib/mysql

EXPOSE 3306

COPY ./tools/init_db.sh /usr/local/bin/init_db.sh
COPY  ./conf/wordpress.sql /usr/local/bin/wordpress.sql
COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

RUN chmod +x /usr/local/bin/init_db.sh
RUN chmod +x /usr/local/bin/wordpress.sql

ENTRYPOINT [ "/usr/local/bin/init_db.sh" ]

CMD [ "mysqld" ]
