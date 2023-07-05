#!/usr/bin/env bash
# install and configure HAproxy

sudo apt update
sudo apt upgrade -y
sudo apt install haproxy -y

conf="\
  frontend http
          bind *:80
          mode http
          default_backend web-server
  backend web-server
          balance rountrobin
          server 91190-web-02 18.207.235.185:80 check
          server 91190-web_01 54.173.223.209:80 check
"

sudo echo "$conf" >>/etc/haproxy/haproxy.cfg
