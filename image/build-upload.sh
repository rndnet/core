#!/bin/bash

set -eou

. common

echo
echo "Build ....."
#podman build -t ${REP}:${TAG} -t ${REP}:${VER} --no-cache  -f Dockerfile
podman build -t ${REP}:${TAG} --no-cache --format docker -f Dockerfile

echo
echo Upload images
podman login docker.io
#podman push ${REP}:${VER}
podman push ${REP}:${TAG}
