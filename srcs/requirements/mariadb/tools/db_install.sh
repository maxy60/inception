#! /bin/sh


DATADIR=/var/lib/mysql


# This function set the default options to mariadb database
secure_database()
{
	cat << EOF | mysql_secure_installation

Y
n
Y
Y
Y
Y
EOF
}


# Create the wordpress database
create_database()
{
	cat << EOF | mariadb -u root
CREATE DATABASE $DB_NAME;
GRANT ALL PRIVILEGES ON $DB_NAME.* TO "$DB_USER"@"localhost" IDENTIFIED BY "$DB_PASSWORD";
GRANT ALL PRIVILEGES ON $DB_NAME.* TO "$DB_USER"@"%" IDENTIFIED BY "$DB_PASSWORD";
FLUSH PRIVILEGES;
EOF
}


main()
{
	if [ ! -z "$(ls -A $DATADIR)" ];
	then
		rc-service mariadb start
		rc-service mariadb stop
	else
		mariadb-install-db --rpm
		rc-service mariadb start
		secure_database
		create_database
		rc-service mariadb restart
		rc-service mariadb stop
	fi
}


main
exec /usr/bin/mysqld --user=mysql --console