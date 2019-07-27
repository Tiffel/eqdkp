#!/bin/bash
echo "creating data dir for mariadb at /data/db/mysql"
mkdir -p /data/db/mysql
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
chmod -R 755 cache uploads inc/settings.php inc/config.php
cd ..
cd ..
echo "downloading and mybb language pack"
mkdir tmp && cd tmp
curl -L https://www.mybb.de/files/downloads/lang_deutsch_du_1821.tar.gz -o mybb_de.tar.gz
tar -zxvf mybb_de.tar.gz
mv Sprachdateien/*  /wwwroot/forum/inc/languages/
cd .. && rm -rf tmp
chown www-data:www-data wwwroot/ -R
mv wwwroot /data/
echo ""
echo "now run docker-compose build"
