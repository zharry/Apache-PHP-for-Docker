FROM ubuntu:latest
MAINTAINER Harry Zhang

RUN apt-get update 
RUN apt-get -y install apache2 && apt-get -y install php7.0 libapache2-mod-php7.0 && apt-get -y install php7.0-gd php7.0-curl php7.0-dev php7.0-mcrypt php7.0-json php7.0-mysql php-pear && apt-get -y install php-apcu && apt-get -y install libcurl4-openssl-dev pkg-config libssl-dev libsslcommon2-dev
RUN pecl install mongodb
RUN /bin/bash -c "echo extension=mongodb.so >> /etc/php/7.0/apache2/php.ini"
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
