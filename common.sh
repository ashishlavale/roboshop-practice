pwd=${pwd}

systemd_setup() {
  cp -r $(pwd)/${component_name} /etc/systemd/system/${component_name}
  systemctl daemon-reload
  systemctl enable ${component_name}
  systemctl start ${component_name}
}

app_pre_setup() {
  useradd roboshop
  mkdir /app
  curl -L -o /tmp/${component_name}.zip https://roboshop-artifacts.s3.amazonaws.com/${component_name}-v3.zip
  cd /app
  unzip /tmp/${component_name}.zip
}

nodejs() {
  dnf module disable nodejs -y
  dnf module enable nodejs:20 -y
  dnf install nodejs -y
  app_pre_setup
  npm install
}

python() {
  dnf install python3 gcc python3-devel -y
  app_pre_setup
  pip3 install -r requirements.txt
}

java() {
  dnf install maven -y
  app_pre_setup
  mvn clean package
  mv target/shipping-1.0.jar shipping.jar
}

golang() {
  dnf install golang -y
  app_pre_setup
}
