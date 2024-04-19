FROM debian:oldstable

RUN apt-get update && apt-get install -y nginx openssl && rm -rf /var/lib/apt/lists/*

EXPOSE 443

COPY ./conf/* ./etc/nginx/conf.d/
COPY ./tools/ ./etc/nginx/tools

ENTRYPOINT [ "bash", "/etc/nginx/tools/nginx.sh" ];

CMD ["nginx", "-g", "daemon off;"]
