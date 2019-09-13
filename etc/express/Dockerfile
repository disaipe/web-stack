ARG VERSION=12.10
FROM node:${VERSION}

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin

WORKDIR /app 

COPY entrypoint.sh /

EXPOSE 3000

USER node

ENTRYPOINT ["/entrypoint.sh"]