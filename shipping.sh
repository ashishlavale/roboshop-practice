if [ -z "$1" ]; then
  echo "Input password is missing"
  exit 1
fi

component_name=shipping
source common.sh

java

dnf install mysql -y
for file in schema app-user master-data; do
mysql -h mysql-dev.ashishlavale5.online -uroot -p$1 < /app/db/$file.sql

systemd_setup
