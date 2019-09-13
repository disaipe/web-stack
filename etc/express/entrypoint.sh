#!/bin/sh
set -e

target=/app

if ! [ -f "$target/package.json" ]; then
    npm install express-generator -g \
        && express --force --view "$EXPRESS_VIEW_ENGINE" --css "$EXPRESS_STYLE_ENGINE" "$target" \
        && cd "$target" \
        && npm install
fi

npm start