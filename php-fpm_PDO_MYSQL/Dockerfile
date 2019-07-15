FROM php:7.3-fpm
# installing required stuff
RUN apt-get update
RUN apt-get install -y unzip libaio-dev libgd2-xpm-dev*
RUN \
    docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install -j$(nproc) gd
