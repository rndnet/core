#!/bin/bash

set -eou

. common

echo
echo "Build ....."
podman build -t ${REP}:${TAG} --no-cache -f Dockerfile
#podman build -t ${REP}:${TAG}-${VER} -t ${REP}:${TAG} --no-cache  -f Dockerfile

echo
echo Upload images
podman login docker.io
#podman push ${REP}:${TAG}-${VER}
podman push ${REP}:${TAG}
