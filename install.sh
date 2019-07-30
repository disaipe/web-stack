#!/bin/bash

echo "Bitrix installation script"
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

# download setup script
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