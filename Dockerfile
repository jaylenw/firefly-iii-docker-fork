FROM jc5x/firefly-iii-base-image:latest

# See also: https://github.com/JC5/firefly-iii-base-image

ARG version
ENV VERSION=$version

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# install Firefly III and execute finalize-image.
RUN curl -SL https://github.com/firefly-iii/firefly-iii/archive/$VERSION.tar.gz | tar xzC $FIREFLY_III_PATH --strip-components 1 && \
    chmod -R 775 $FIREFLY_III_PATH/storage && \
    composer install --prefer-dist --no-dev --no-scripts --no-suggest && /usr/local/bin/finalize-image.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
