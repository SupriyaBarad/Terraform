#!/bin/bash
apt update -y
apt install apache2 -y
systemctl start apache2
mkdir /var/www/html/cloth
echo "Hello from Cloth" > /var/www/html/cloth/index.html
