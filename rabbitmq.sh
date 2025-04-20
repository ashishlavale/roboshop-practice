if [ -z "$1" ]; then
  echo "input password is missing"
  exit 1
fi

cp rabbitmq.repo /etc/yum.repos.d/rabbitmq.repo
dnf install rabbitmq-server -y

systemctl enable rabbitmq-server
systemctl start rabbitmq-server

rabbitmqctl add_user roboshop $1
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"

