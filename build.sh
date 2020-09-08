#!/bin/bash

set -eou

. common

echo
echo "Build ....."
podman build -t ${REP}:${TAG} -t ${REP}:${VER} --no-cache  -f Dockerfile-all

echo
#echo Upload images
#podman login docker.io
#podman push ${REP}:${TAG}-${VER}
#podman push ${REP}:${TAG}
