FROM debian:oldstable

RUN apt-get update && apt-get install -y \
				wget				\
				php7.4				\
				php7.4-fpm			\
				php7.4-mysqli 		\
				mariadb-client		\
				&& rm -rf /var/lib/apt/lists/*
				

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d

RUN mkdir -p /var/run/php && chmod 777 /var/run/php
RUN mkdir -p /var/www/html

COPY ./tools/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["bash", "/usr/local/bin/entrypoint.sh"]

WORKDIR /var/www/html/
EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.4", "-F"]
