#!/bin/bash
#rndnet_server --config /opt/rndnet/rndnet_server.conf --bind 127.0.0.1:6000 --no-ssl -w 15 --no-cleanup
rndnet_server --config /opt/rndnet/rndnet_server.conf --accesslog /opt/rndnet/rndnet_server.log --bind 127.0.0.1:6000 --no-ssl -w 15 --no-cleanup
