. common
podman run -d --rm --name rndnet_scheduler -v $(pwd)/files:/opt ${REP}:${TAG} /opt/rndnet/start-sched.sh
