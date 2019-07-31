#!/bin/bash

echo "Evolution CMS installation script"
echo
echo "This will destroy all data in ./data and ./src/public folders"

read -r -p "Are you sure [y/N]" response

case "$response" in
	[yY]) ;;
	*) exit 0
esac

# load environment
set -o allexport
[[ -f .env ]] && source .env
set +o allexport

echo

# remove old data
echo "Removing previous installations..."
rm -rf data/*
rm -rf src/public/*

# download and extract evolution cms
EVOCMS_VERSION="1.4.9"

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

echo "Creating config file..."
touch src/public/manager/includes/config.inc.php
chmod 666 src/public/manager/includes/config.inc.php

echo "Installation complete"
echo
echo "Now you can start services and open your site in browser: http://$HOSTNAME:$HTTP_PORT"
echo "$ docker-compose up -d lamp"