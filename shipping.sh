component_name=shipping
source common.sh

java

dnf install mysql -y
mysql -h mysql-dev.ashishlavale5.online -uroot -pRoboShop@1 < /app/db/schema.sql
mysql -h mysql-dev.ashishlavale5.online -uroot -pRoboShop@1 < /app/db/app-user.sql
mysql -h mysql-dev.ashishlavale5.online -uroot -pRoboShop@1 < /app/db/master-data.sql

system_setup
