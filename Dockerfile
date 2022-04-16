FROM php:8.0-apache
LABEL tony <nitao.227@foxmail.com>

ENV APACHE_DOCUMENT_ROOT /var/www/zentaopms/www

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && apt-get update && \
	apt-get install -y vim wget unzip libwebp-dev libjpeg-dev libpng-dev libfreetype6-dev && docker-php-ext-install pdo pdo_mysql gd && \
	mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
COPY php.ini /usr/local/etc/php/
RUN a2enmod rewrite
