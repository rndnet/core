. common
podman run -it --rm --name rndnet_scheduler -v $(pwd)/files:/opt ${REP}:${TAG} /opt/rndnet/start-sched.sh
#podman run -it --rm --name rndnet_scheduler -v $(pwd)/files:/opt ${REP}:${TAG} bash
