pwd=${pwd}

systemd_setup() {
  cp -r $(pwd)/${comonent_name} /etc/systemd/system/${comonent_name}
  systemctl daemon-reload
  systemctl enable ${comonent_name}
  systemctl start ${comonent_name}
}

app_pre_setup() {
  useradd roboshop
  mkdir /app
  curl -L -o /tmp/${comonent_name}.zip https://roboshop-artifacts.s3.amazonaws.com/${comonent_name}-v3.zip
  cd /app
  unzip /tmp/${comonent_name}.zip
}

nodejs() {
  dnf module disable nodejs -y
  dnf module enable nodejs:20 -y
  dnf install nodejs -y
  app_pre_setup
  npm install
}
