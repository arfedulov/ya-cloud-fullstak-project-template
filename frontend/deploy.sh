#!/usr/bin/env bash

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd ROOT_DIR
DIST_DIR="./dist/"

npm ci
npm run build

source ./.yandex-cloud.env

aws s3 sync --delete $DIST_DIR s3://$BUCKET_NAME/

echo "Файлы загружены в Object Storage"