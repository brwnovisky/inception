FROM debian:oldstable

RUN apt -y update && apt -y install nodejs npm
 
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY ./src/* /usr/src/app/

EXPOSE 8080

ENTRYPOINT [ "npx", "-y", "http-server" ]
