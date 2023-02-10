#!/usr/bin/env bash

## Usage
## sh ./scripts/image-exchange.sh <tag> <location> <project> <artefact_repo> <image_name>

TAG=${1:-"latest"}
LOCATION=${2:-"europe-west1"}
PROJECT=${3:-"<GCP PROJECT>"}
ARTEFACT_REPO=${4:-"<SERVICE NAME>"}
IMAGE_NAME=${5:-"<IMAGE NAME>"}

echo ">> Pulling Image"
docker pull ghcr.io/requarks/$IMAGE_NAME:$TAG --platform=x86_64 #   --platform=x86_64 is m1 workaround

echo ">> Tagging Image"
docker tag ghcr.io/requarks/$IMAGE_NAME:$TAG $LOCATION-docker.pkg.dev/$PROJECT/$ARTEFACT_REPO/$IMAGE_NAME:$TAG

echo ">> Pushing Image"
docker push  $LOCATION-docker.pkg.dev/$PROJECT/$ARTEFACT_REPO/$IMAGE_NAME:$TAG
