#!/bin/bash
set -e

echo "🚀 Installation de l'environnement Frappe..."

sudo apt-get update -q
sudo apt-get install -y \
  mariadb-server \
  redis-server \
  wkhtmltopdf \
  git

sudo service mariadb start
sudo service redis-server start

npm install -g yarn

pip install frappe-bench

sudo mysql -e "
  ALTER USER 'root'@'localhost'
  IDENTIFIED VIA mysql_native_password
  USING PASSWORD('root');
  FLUSH PRIVILEGES;
"

echo "✅ Environnement prêt !"

