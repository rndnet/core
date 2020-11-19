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
3. Modify pods hostname in  kube-rndnet-server.yaml (optionally)
4. Run kube-preinstall.sh for secrets and service creating 
 - ca/0-add-config-as-secret.sh - put server config to kubernetes secrets;
 - ca/1-add-nodeport-service.yaml (optionally) - create nodeport service if need access from corporate  network, modify or remove clusterIP and nodePort;
 - ca/2-add-external-service.yaml (optionally) - create external service if need access from internet or you can use kubernetes nginx ingress controller feature for this purpose.
5. Deploy server: kube-install.sh
    
