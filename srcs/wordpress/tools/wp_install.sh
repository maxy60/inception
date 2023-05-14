
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp


wp core download --path=/var/www/wordpress --force --skip-content

wp config create \
    --dbname="${DB_NAME}" \
    --dbuser="${DB_USER}" \
    --dbpass="${DB_PASSWORD}" \
    --dbhost=mariadb:3306 \
    --path='/var/www/wordpress'
wp db create
wp core install \
    --url="${DOMAIN_NAME}" \
    --title="${TITLE}" \
    --admin_user="${ADMIN_USER}" \
    --admin_password="${ADMIN_PASSWORD}" \
    --admin_email="${ADMIN_EMAIL}" \
    --skip-email
wp user create "${USER_NAME}" "${USER_EMAIL}" \
    --user_pass="${USER_PASS}" \
    --porcelain

mkdir -p /run/php

exec php-fpm8 -F