chown -R www-data:www-data /var/www/
if [ ! -f "/var/www/html/wordpress/index.php" ]; then
	sudo -u www-data sh -c " \
	wp core download --locale=$WP_LANG && \
	wp config create --dbname=$WP_DB_HOST --dbuser=$WP_DB_USER --dbpass=$WP_DB_PW --dbhost=$WP_DB_HOST --dbcharset="utf8"
	wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_DB_ADMIN --admin_password=$WP_DB_ADMIN_PW --admin_email=$WP_DB_ADMIN_EMAIL --skip-email && \
	wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PW && \
	wp plugin update --all
	"
fi
exec /usr/sbin/php-fpm7.3 -F
