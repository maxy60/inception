FROM alpine:3.16

#update && install  necessary to wordpress
RUN apt update && apt upgrade && apk add --no-cache\
        php7-fpm \
        php7-mysqli \
        php7-pdo_mysql \
        php7-gd \
        php7-curl \
        php7-json \
        php7-zip \
        php7-opcache \
        php7-xml \
        php7-dom \
        php7-session \
        php7-mbstring \

EXPOSE 9000

CMD ["sh", "/conf/wp_install.sh"]