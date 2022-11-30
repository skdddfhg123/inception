service mysql start;
cat ./.setup 2> /dev/null
if [ $? -ne 0 ]; then
	mysql -e "CREATE DATABASE IF NOT EXISTS $RDB_DATABASE;"
	mysql -e "CREATE USER '$RDB_USER'@'%' IDENTIFIED BY '$RDB_PW';"
	mysql -e "GRANT ALL PRIVILEGES ON $RDB_DATABASE.* TO '$RDB_USER'@'%';"
	mysql -e "FLUSH PRIVILEGES;"
	mysql -e "ALTER USER '$RDB_ROOT'@'localhost' IDENTIFIED BY '$RDB_ROOT_PW';"

	mysql $RDB_DATABASE -u$RDB_ROOT -p$RDB_ROOT_PW
	mysqladmin -uroot -p$RDB_ROOT_PW shutdown

	touch ./.setup
fi

exec mysqld
