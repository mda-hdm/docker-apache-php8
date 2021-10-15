FROM alpine:edge

RUN apk update && \
	apk add --no-cache \
	bash \
	shadow \
	ca-certificates \
	openssl \
	openssh \
	apache2 \
	php8-apache2 \
	curl \
	php8-zip \
	php8-gd \
	php8-curl \
	php8-session \
	php8-exif \
	php8-fileinfo \
	php8-opcache

RUN ln -s /usr/bin/php8 /usr/bin/php \
	&& rm -f /var/cache/apk/*

RUN usermod -u 1000 apache

RUN mkdir /app && \
	chown -R apache:apache /app && \
	chmod -R 755 /app

COPY php.ini /etc/php8/php.ini
COPY index.php /app

WORKDIR /app
VOLUME /app

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 80
ENTRYPOINT ["entrypoint.sh"]
CMD ["httpd", "-D", "FOREGROUND"]