#!/bin/bash

echo "Wordpress installation script"
echo

source wipe.sh

# load environment
set -o allexport
[[ -f .env ]] && source .env
set +o allexport

if [[ "$1" == "ru" ]]; then
    echo "Setting up RU locale..."
    url="https://ru.wordpress.org/latest-ru_RU.tar.gz"
else
    url="https://wordpress.org/latest.tar.gz"
fi

# download and extract cms
echo
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