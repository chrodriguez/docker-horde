FROM php:5.6-apache
ARG HORDE_WEBMAIL_VERSION=5.2.22
WORKDIR /var/www/html

# Reqs de https://www.horde.org/apps/webmail/docs/INSTALL
# Modulos:
# ========
# gettext
# xml & domxml
# pdo y mysqli
# ldap
# mbstring
# gd
# tidy
# openssl
# fileinfo
# intl
# curl
# ftp
#
# PEAR extensions
# ===============
# Date
# Net_DNS2
# Services_Weather
# Date_Holidays
# Net_Sieve
# 
# PECL extensions
# ===============
# fileinfo
# imagick
# horde_lz4
# memcache
# http
#
# Apps
# =====
# aspell
# FTP
# En php.ini 
# ============
# upload_max_filesize = 15M
# post

RUN apt-get update && \
    apt-get install -y gettext && \
    docker-php-ext-configure intl && \
    docker-php-ext-install intl && \
    docker-php-ext-install gettext

RUN docker-php-ext-configure imap --with-imap --with-imap-ssl && \
    docker-php-ext-install imap && \
    docker-php-ext-install -j$(nproc) iconv mcrypt gettext && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install -j$(nproc) gd

RUN pear install horde/horde_role && \
    echo 'a:1:{s:10:"__channels";a:4:{s:12:"pecl.php.net";a:0:{}s:5:"__uri";a:0:{}s:11:"doc.php.net";a:0:{}s:14:"pear.horde.org";a:1:{s:9:"horde_dir";s:19:"/var/www/html/horde";}}}' > /root/.pearrc && \
    pear install -a -B -f horde/webmail-${HORDE_WEBMAIL_VERSION}
#RUN rm -fr /tmp/pear
# && \
RUN sed -i 's/ServerTokens OS/ServerTokens Prod/g;s/ServerSignature On/ServerSignature Off/g;s/Indexes//g;s/#LoadModule rewrite_module/LoadModule rewrite_module/g' /etc/apache2/httpd.conf 



