. common 
helm install -name $name -n $ns ./rndnet-server \
  --set virtualserver.enabled=true  \
  --set virtualserver.host='server.yourdomain' \
  --set virtualserver.tls.secret='rndnet-nginx-cert' \
  --set service.externalIPs={'XXX.XXX.XXX.XX'} \
  --set server.workers=20 \
  --set server.cleanup=false \
  --set server.conf.connect.host='host1' \
  --set server.conf.connect.port=5432 \
  --set server.conf.email.MAIL_DEFAULT_SENDER='server@yourdomain'  \
  --set server.conf.email.MAIL_SERVER='smtp_host' \
  --set server.conf.rabbitmq='amqp://user:pass@rabbitmq_host:5672/%2F' \
  --set server.pgpass='database_host:*:*:bf_user:pass' \
  --set resources.limits.memory='16Gi' \
  --set resources.limits.cpu=20 \
  --set resources.requests.memory='2Gi' \
  --set resources.requests.cpu=10 \
  -f values.yaml


# --set service.type=NodePort
