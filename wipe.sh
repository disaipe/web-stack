#!/bin/bash

echo "This will destroy all data in ./data and ./src/public folders"
read -r -p "Are you sure [y/N] " response

case $response in
	[yY]) 
		echo "Removing previous installations..."
		rm -rf data/*
		rm -rf src/*
		mkdir src/public
		;;
	*) 
		echo "Clean canceled"
		exit 0
		;;
esac
