FROM php:5.6-apache

WORKDIR /var/www/html

RUN pear install horde/horde_role && \
    echo 'a:1:{s:10:"__channels";a:4:{s:12:"pecl.php.net";a:0:{}s:5:"__uri";a:0:{}s:11:"doc.php.net";a:0:{}s:14:"pear.horde.org";a:1:{s:9:"horde_dir";s:19:"/var/www/html/horde";}}}' > /root/.pearrc && \
    pear install -a -B -f horde/webmail
#RUN rm -fr /tmp/pear

RUN docker-php-ext-configure imap --with-imap --with-imap-ssl && \
    docker-php-ext-install imap && \
    docker-php-ext-install -j$(nproc) iconv mcrypt gettext && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install -j$(nproc) gd
# && \
RUN sed -i 's/ServerTokens OS/ServerTokens Prod/g;s/ServerSignature On/ServerSignature Off/g;s/Indexes//g;s/#LoadModule rewrite_module/LoadModule rewrite_module/g' /etc/apache2/httpd.conf 



