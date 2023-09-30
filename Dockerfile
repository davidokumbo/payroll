FROM php:7.4.3-apache
RUN apt-get update -y
RUN apt-get update && apt-get install -y curl
RUN apt-get install -y unzip libpq-dev libcurl4-gnutls-dev
# RUN docker-php-ext-install pdo pdo_mysql bcmath
RUN pecl install -o -f redis \
&& rm -rf /tmp/pear \
&& docker-php-ext-enable redis

WORKDIR /var/www
COPY . .
COPY --from=composer:2.5.7 /usr/bin/composer /usr/bin/composer
ENV PORT=5000
RUN chmod +x Docker/entrypoint.sh
# ENTRYPOINT ["Docker/entrypoint.sh"]