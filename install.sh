#!/bin/bash

echo "Wordpress installation script"
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

if [[ "$1" == "ru" ]]; then
    echo "Setting up RU locale..."
    url="https://ru.wordpress.org/latest-ru_RU.tar.gz"
else
    url="https://wordpress.org/latest.tar.gz"
fi

# download and extract evolution cms
echo "Downloading distribution kit..."
curl -Ls ${url} --output src/distr.tar.gz

echo "Extracting..."
tar xf src/distr.tar.gz -C src &&\
	rm src/distr.tar.gz

echo "Moving..."
mv src/wordpress/* src/public/
rm -r src/wordpress

echo "Installation complete"
echo
echo "Now you can start services and open your site in browser: http://$HOSTNAME:$HTTP_PORT"
echo "$ docker-compose up -d lamp"