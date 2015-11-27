FROM composer/composer

WORKDIR /tmp

RUN composer selfupdate && \
    composer require robmorgan/phinx --prefer-source --no-interaction && \
    ln -s /tmp/vendor/bin/phinx /usr/local/bin/phinx

RUN mkdir -p /data
VOLUME /data

WORKDIR /data/www

ENTRYPOINT ["/usr/local/bin/phinx"]
CMD ["--help"]