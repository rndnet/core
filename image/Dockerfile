FROM docker.io/python:3.7-slim

RUN apt-get update && \
    apt-get install -y curl git libgl1 libglib2.0-0 && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

RUN curl -o requirements.txt https://server1.rndnet.net/static/simple/rndnet-scheduler/requirements.txt && \
    pip install $(cat /requirements.txt | grep -iv pyqt | grep -v qscintilla) pyqt5 && \
    pip install --index-url https://server1.rndnet.net/static/simple bfj && \
    pip install --index-url https://server1.rndnet.net/static/simple rndnet-scheduler 

ENTRYPOINT ["rndnet_scheduler", "--sched", "k8s"]

