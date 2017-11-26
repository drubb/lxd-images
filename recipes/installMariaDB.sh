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
apk --update add mariadb mariadb-client
/etc/init.d/mariadb setup
rc-service mariadb start
mysql -e "CREATE USER '${DBUSER}'@'%' IDENTIFIED BY '${DBPASS}';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${DBUSER}'@'%' IDENTIFIED BY '${DBPASS}' WITH GRANT OPTION;"
mysql -e "DROP DATABASE test; DELETE FROM mysql.user WHERE Host <> '%'; FLUSH PRIVILEGES;"
rc-update add mariadb
}
