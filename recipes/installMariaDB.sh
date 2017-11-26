#!/bin/sh

set -ex

#
# LXD images recipe: MariaDB
#
# Dependencies: none
#
# Environment variables:
#
# - DBUSER - database user, e.g. 'drupal', default 'root'
# - DBPASS - database password, e.g. 'drupal', default ''
#

installMariaDB() {
DBUSER=${DBUSER:-"root"}
DBPASS=${DBPASS:-""}
cp /config/mysql /root/.my.cnf
sed -i "s/^user=.*/user=${DBUSER}/g" /root/.my.cnf
sed -i "s/^password=.*/password='${DBPASS}'/g" /root/.my.cnf
apk --update add mariadb mariadb-client
/etc/init.d/mariadb setup
rc-service mariadb start
mysql -uroot -e "CREATE USER '${DBUSER}'@'%' IDENTIFIED BY '${DBPASS}';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO '${DBUSER}'@'%' IDENTIFIED BY '${DBPASS}' WITH GRANT OPTION;"
mysql -uroot -e "DROP DATABASE test; DELETE FROM mysql.user WHERE Host <> '%'; FLUSH PRIVILEGES;"
rc-update add mariadb
}
