FROM alpine:3.16

#update && install  necessary to mariadb
RUN apk update && apk upgrade && apk add --no-cache\
        mariadb\
        mariadb-client\
        mariadb-common\
        openrc

RUN openrc\
	&& touch /run/openrc/softlevel

COPY conf/my.cnf /etc/
COPY conf/mariadb-server.cnf /etc/my.cnf.d/
COPY ./tools/db_install.sh /tmp/db_install.sh

EXPOSE 3306

CMD ["sh", "/tmp/db_install.sh"]
#CMD ["ping", "0.0.0.0"]