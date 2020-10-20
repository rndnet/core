FROM docker.io/python:3.7-slim

RUN apt-get update &&  apt-get install -y wget libgl1 libglib2.0-0 libgssapi-krb5-2 build-essential && \
    rm -rf /var/lib/apt/lists/* && \
    pip install -r https://server1.rndnet.net/static/simple/rndnet-server/requirements.txt && \
    pip install --index-url https://server1.rndnet.net/static/simple rndnet-server

ENTRYPOINT ["rndnet_server"]
