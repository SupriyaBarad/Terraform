#!/bin/bash
apt update -y
apt install apache2 -y
systemctl start apache2
mkdir /var/www/html/laptop
echo "Hello from Laptop" > /var/www/html/laptop/index.html
