FROM ubuntu:latest
MAINTAINER Harry Zhang

RUN apt-get update && \
    apt-get -y install \
        apache2 && \
    apt-get -y install \
        php7.0 \
        libapache2-mod-php7.0 && \
    apt-get -y install 
        php7.0-curl \
        php7.0-dev \
        php7.0-gd \
        php7.0-json \
        php7.0-mysql \
	php7.0-xml \
        php7.0-mbstring \
        php7.0-mcrypt && \
    apt-get -y install \
        php-pear \
        php-apcu && \
    apt-get -y install \
        libcurl4-openssl-dev \
        pkg-config \
        libssl-dev \
        libsslcommon2-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pecl install mongodb
RUN /bin/bash -c "echo extension=mongodb.so >> /etc/php/7.0/apache2/php.ini"

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

RUN /usr/sbin/a2ensite default-ssl
RUN /usr/sbin/a2enmod ssl

EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
