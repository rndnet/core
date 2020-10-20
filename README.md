# Kubernetes rndnet-server (core:server)

Use rndnet-server as kubernetes pod service

Build image (optionally)
--------------------------

1. cd image
2. ./build-upload.sh

Install on kubernetes
-------

1. Modify server config in ca/rndnet_server.conf
2. Modify server args and port in kube-rndnet-server.yaml
3. Modify pods hostname in  kube-rndnet-server.yaml
4. Modify or remove clusterIP and nodePort in ca/1-add-nodeport-service.yaml
5. Run kube-preinstall.sh for secrets and service creating 
6. Deploy server: kube-install.sh
    
