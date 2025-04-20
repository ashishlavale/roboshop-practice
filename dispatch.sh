component_name=dispatch
source common.sh

golang

go mod init dispatch
go get
go build

systemd_setup