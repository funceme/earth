FROM node:8.9.4-alpine

MAINTAINER Luítame de Oliveira <luitame.oliveira@funceme.br>

ENV APP_NAME earth \
    NODE_ENV production

WORKDIR /usr/src/$APP_NAME

COPY --chown=node:node application/package*.json ./
COPY --chown=node:node confs/pm2_process.yml ./process.yml

RUN npm install --silent pm2 -g \
    && npm install --silent --only=production

COPY --chown=node:node application /usr/src/$APP_NAME

EXPOSE 8080
CMD ["pm2-runtime", "--json", "process.yml"]

# RUN ln -sf /dev/stdout /var/log/nginx/access.log
# RUN ln -sf /dev/stderr /var/log/nginx/error.log