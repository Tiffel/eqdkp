mkdir code && cd code
curl -L https://eqdkp-plus.eu/repository/download/latestcore -o eqdkp.zip
unzip eqdkp.zip && rm eqdkp.zip
cd ..

docker-compose build