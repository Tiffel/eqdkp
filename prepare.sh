#!/bin/bash
echo "downloading and unziping eqdkp"
mkdir eqdkp && cd eqdkp
curl -L https://eqdkp-plus.eu/repository/download/latestcore -o eqdkp.zip
unzip eqdkp.zip && rm eqdkp.zip
cd ..
chown www-data:www-data eqdkp/ -R
echo "creating data dir for mariadb at /data/db/mysql"
mkdir -p /data/db/mysql
echo ""
echo "now run docker-compose build"
