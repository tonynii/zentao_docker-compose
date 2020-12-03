FROM php:7.2-apache
MAINTAINER tony <nitao.227@foxmail.com>

ENV APACHE_DOCUMENT_ROOT /var/www/zentaopms/www

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && apt-get update && \
	apt-get install -y vim wget unzip  && docker-php-ext-install pdo pdo_mysql && \
	cd /var/www/ && wget https://dl.cnezsoft.com/zentao/12.5/ZenTaoPMS.12.5.stable.zip \ 
	&& ls -l && unzip -q ZenTaoPMS.12.5.stable.zip && rm ZenTaoPMS.12.5.stable.zip && \
	mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" && chmod o=rwx -R ${APACHE_DOCUMENT_ROOT}
COPY php.ini /usr/local/etc/php/
RUN a2enmod rewrite

