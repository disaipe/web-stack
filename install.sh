#!/bin/bash

echo "Evolution CMS installation script"
echo

source wipe.sh

# load environment
set -o allexport
[[ -f .env ]] && source .env
set +o allexport

# download and extract cms
EVOCMS_VERSION="1.4.9"

echo
echo "Downloading distribution kit..."
curl -Ls "https://github.com/evolution-cms/evolution/archive/$EVOCMS_VERSION.tar.gz" --output src/distr.tar.gz

echo "Extracting..."
tar xf src/distr.tar.gz -C src &&\
	rm src/distr.tar.gz

echo "Moving..."
mv src/evolution-${EVOCMS_VERSION}/* src/public/
rm -r src/evolution-${EVOCMS_VERSION}

mv src/public/ht.access src/public/.htaccess

echo "Set permissions..."
chmod -R 777 src/public/assets/cache \
	src/public/assets/images \
	src/public/assets/files \
	src/public/assets/backup \
	src/public/assets/.thumbs \
	src/public/assets/export

echo "Patch mcpuk..."
sed -i 's/_.kuki.domain/\/\/_.kuki.domain/' src/public/manager/media/browser/mcpuk/tpl/tpl_javascript.php

echo "Installation complete"
echo
echo "Now you can start services and open your site in browser: http://$HOSTNAME:$HTTP_PORT"
echo "$ docker-compose up -d lamp"
