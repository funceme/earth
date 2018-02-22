FROM node:8.9.4-alpine

MAINTAINER Luítame de Oliveira <luitame.oliveira@funceme.br>

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log
