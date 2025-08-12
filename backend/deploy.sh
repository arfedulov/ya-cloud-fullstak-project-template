#!/usr/bin/env bash

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $ROOT_DIR
DIST_DIR="./yandexCloudFnDist"
FUNCTION_ARCHIVE_PATH="./yandexCloudFn.zip"

npm --omit=dev ci

if [[ -d $DIST_DIR ]]; then
  echo "Удаление существующей директории ${DIST_DIR}..."
  rm -rf $DIST_DIR
fi

rm -f $FUNCTION_ARCHIVE_PATH

echo "Создание новой директории ${DIST_DIR}..."
mkdir $DIST_DIR

echo "Перемещение исходных файлов в ${DIST_DIR}..."
cp -R \
  package.json \
  node_modules/ \
  src/ \
  $DIST_DIR/

echo "Архивация содержимого директории ${DIST_DIR}..."
zip -r $FUNCTION_ARCHIVE_PATH $DIST_DIR

echo "Yandex Cloud Function собрана"

source ./.yandex.cloud.env

echo "Загрузка Yandex Cloud Function в облако..."

yc serverless function version create \
  --function-name="${FUNCTION_NAME}" \
  --runtime nodejs22 \
  --entrypoint "yandexCloudFnDist/src/controller/yandexCloudFunction.handler" \
  --memory 128m \
  --execution-timeout 5s \
  --environment TELEGRAM_BOT_TOKEN="${TELEGRAM_BOT_TOKEN}" \
  --environment TELEGRAM_CHAT_ID="${TELEGRAM_CHAT_ID}" \
  --source-path ./yandexCloudFn.zip
