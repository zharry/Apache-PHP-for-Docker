# Apache-PHP-for-Docker
Latest Apache, PHP7.0 and a couple of PHP7.0 modules including MongoDB and MySQL drivers. Dockerfile for image

## Usage:
docker run --rm -p _Outgoing HTTP_**:80 -p _Outgoing HTTPS_**:443 -v _Local HTML Directory_**:/var/www/html:ro zharry/apache-php

### Base Image:
- ubuntu:latest (16.04)

### Installed Packages:
- Apache2
- PHP7.0
- OpenSSL

### PHP7.0 Modules:
- MySQL
- MongoDB
- CUrl
- GD
- MCrypt
- JSON
- APCu

### Ports:
- 80 for HTTP
- 443 for HTTPS
