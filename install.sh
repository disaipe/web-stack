#!/bin/bash

echo "Bitrix installation script"
echo

source wipe.sh

# load environment
set -o allexport
[[ -f .env ]] && source .env
set +o allexport

# remove old data
echo "Removing previous installations..."
rm -rf data/*
rm -rf src/public/*

# download setup script
echo
echo "Donwloading installation script..."
curl -Ls http://www.1c-bitrix.ru/download/scripts/bitrixsetup.php --output src/public/setup.php

# create index with redirect
echo "<? header('Location: /setup.php');" > src/public/index.php;

# set folder permissions
chmod -R 777 src/public

echo "Installation complete"
echo
echo "Now you can start services and open your site in browser: http://$HOSTNAME:$HTTP_PORT"
echo "$ docker-compose up -d lemp"