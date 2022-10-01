#!/bin/sh

echo "BUILD PROD IMAGE"
VERSION_ARG=$1
VERSION=${VERSION_ARG:="0.0.1"}

REGISTRY="registry.susa.cloud"

PACKAGE_VERSION=$(cat package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g' \
  | tr -d '[[:space:]]')

echo $PACKAGE_VERSION

SERVER_IMAGE_TAG="${REGISTRY}/docker-geo-tools:v${PACKAGE_VERSION}"
echo $SERVER_IMAGE_TAG

docker build --target tools -t $SERVER_IMAGE_TAG .
