
install_wp_cli()
{
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
}

install_wp()
{
    wp core download --path=/var/www/wordpress --force --skip-content
}

install_db_conf_wp()
{
    cd /var/www/wordpress
    sleep 10
    wp config create --allow-root \
        --dbname="${DB_NAME}" \
        --dbuser="${DB_USER}" \
        --dbpass="${DB_PASSWORD}" \
        --dbhost=mariadb:3306 \
        --path='/var/www/wordpress'
    wp db create
}

config_wp()
{
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
}

main()
{
    install_wp_cli
    if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
        install_wp
        install_db_conf_wp
        config_wp
		wp cron event run --due-now
    else
        echo "already create"
    fi

    exec php-fpm8 -F
}

main