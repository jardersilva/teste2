FROM node:14-alpine

RUN mkdir -p /app

WORKDIR /usr/src/app

RUN chmod -R 444 /etc/apk/
RUN echo "ipv6" >> /etc/modules

RUN set -x \
    && apk update \
    && apk upgrade \
RUN apk add -f

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
ENV CHROMIUM_PATH /usr/bin/chromium-browser

# Installs latest Chromium package.
RUN apk add --no-cache \
    chromium \ 
    nss \
    freetype \
    freetype-dev \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    nodejs \
    npm \
    yarn

RUN yarn add puppeteer@2.0.0 adal-node@0.2.0 azure-keyvault@3.0.4 azure-sb@0.11.1 azure-storage@2.10.3 http@0.0.0

COPY package*.json ./

RUN npm i

EXPOSE 80

CMD [ "npm", "start"]