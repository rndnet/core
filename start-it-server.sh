. common
#podman run -it --rm --name rndnet_server -v $(pwd)/files:/opt -v $HOME/.pgpass:/root/.pgpass  -p ${SERVER_EXT_PORT}:6000 ${REP}:${TAG} /opt/rndnet/start-server.sh
podman run -it --rm --name rndnet_server -v $(pwd)/files:/opt -v $HOME/.pgpass:/root/.pgpass  -p ${SERVER_EXT_PORT}:6000 ${REP}:${TAG} bash
