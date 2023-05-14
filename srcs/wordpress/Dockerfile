FROM alpine:3.16

#update && install  necessary to wordpress
RUN apk update && apk upgrade && apk add --no-cache\
	curl\
	mariadb-client\
	php\
	php8-curl\
	php8-ctype\
	php8-dom\
	php8-exif\
	php8-fileinfo\
	php8-fpm\
	php8-gd\
	php8-iconv\
	php8-intl\
	php8-mbstring\
	php8-mysqli\
	php8-pecl-imagick\
	php8-phar\
	php8-redis\
	php8-session\
	php8-xml\
	php8-zip

RUN adduser -D -g 'www' www\
	&& mkdir -p /var/www/wordpress\
	&& chown www:www /var/www/wordpress

COPY ./conf/www.conf /etc/php8/php-fpm.d/

EXPOSE 9000

COPY ./tools/wp_install.sh /tmp/wp_install.sh

CMD ["sh", "/tmp/wp_install.sh"]