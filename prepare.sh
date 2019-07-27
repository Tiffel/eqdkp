#!/bin/bash
echo "downloading and unziping eqdkp"
mkdir wwwroot && cd wwwroot
curl -L https://eqdkp-plus.eu/repository/download/latestcore -o eqdkp.zip
unzip eqdkp.zip && rm eqdkp.zip
echo "downloading and unziping mybb"
mkdir forum && cd forum
curl https://resources.mybb.com/downloads/mybb_1821.zip -o mybb.zip
unzip mybb.zip "Upload/*"
mv Upload/* .
rm -Rf Upload mybb.zip
mv inc/config.default.php inc/config.php
chmod -R 750 cache uploads inc/settings.php inc/config.php
cd ..
cd ..
chown www-data:www-data wwwroot/ -R
echo "creating data dir for mariadb at /data/db/mysql"
mkdir -p /data/db/mysql
echo ""
echo "now run docker-compose build"
