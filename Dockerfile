FROM php:apache

MAINTAINER Billaud <william.billaud@isen.yncrea.fr>

# Setup system timezone
RUN echo "Europe/Paris" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

# Fix docker-php-ext-install script error
RUN sed -i 's/docker-php-\(ext-$ext.ini\)/\1/' /usr/local/bin/docker-php-ext-install

# Install Xdebug
RUN pecl install xdebug-2.5.0 \
    && docker-php-ext-enable xdebug
COPY ext-xdebug.ini /usr/local/etc/php/conf.d/

#Add default.conf files
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
# Enable Apache2 rewrite module
RUN a2enmod rewrite \
	&& service apache2 restart
