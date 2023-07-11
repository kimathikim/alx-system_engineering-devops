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
          server 91190-web-02 54.160.90.197:80 check
          server 91190-web_01 52.3.254.30:80 check
"

echo "$conf" | sudo tee -a /etc/haproxy/haproxy.cfg >/dev/null
