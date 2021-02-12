installer_dir="$(pwd)"

read -e -p "New server name:" -i "rndnet-server-" name 

target_dir="$(dirname $(dirname "$installer_dir"))"/$name
read -e -p "Target dir:" -i ""${target_dir} target_dir 

read -e -p "Namespace: "  -i "default" ns
read -e -p "Cloud Database host:  " -i "host1" cloud_dbhost

read -e -p "Create nginx ingress controller installer for this server [y/n]? " -i "y"  is_create_nginx
if [[ $is_create_nginx = y ]] ; then

  read -e -p "Internet host name: "     -i "server.yourdomain" ihost
  read -e -p "Internet external ip: "   -i "200.100.100.10" ext_ip
  read -e -p "Internet external port: " -i "5000" ext_port
  read -e -p "Certificate: "            -i "nginx-cert"  cert

  read -e -p "Create nginx cert installer? [y/n]? " -i "n"  is_cert_create
  if [[ $is_cert_create = y ]] ; then
    read -e -p "Fullchain cer file path: " -i "/opt/rndnet/fullchain.cer" crt
    read -e -p "Key file path: "           -i "/opt/rndnet/server.yourdomain.key" key
  fi
  
   ingress_class=nginx-$name
fi

read -e -p "Install from helm package (y) or from helm sources [any]? " -i "y"  helm_install_from_package
if [[ $helm_install_from_package = y ]] ; then
  read -e -p "Define helm repository name: " -i "rndnet-charts"  helm_install_prefix
else
  read -e -p "Define helm sources path: " -i ${installer_dir}  helm_install_prefix
fi


mkdir -p ${target_dir}

#Install.sh generator
cat >  ${target_dir}/install.sh  << EOF
. common
helm install -name \$name \$is_test  -n \$ns $helm_install_prefix/rndnet-server \\
  --set server.workers=20 \\
  --set server.cleanup=false \\
  --set server.conf.connect.host=\$cloud_dbhost \\
  --set server.conf.connect.dbname=cloud \\
  --set server.conf.connect.port=5432 \\
  --set server.conf.email.MAIL_DEFAULT_SENDER='server@yourdomain'  \\
  --set server.conf.email.MAIL_SERVER='smtp_host' \\
  --set server.conf.rabbitmq='amqp://user:pass@rabbitmq_host:5672/%2F'  \\
  --set server.pgpass="\${cloud_dbhost}:*:*:bf_user:pass" \\
  --set resources.limits.memory='16Gi' \\
  --set resources.limits.cpu=20 \\
  --set resources.requests.memory='2Gi' \\
  --set resources.requests.cpu=10 \\
  -f values.yaml \\
EOF

if [[ $is_create_nginx = y ]] ; then
 cat >>  ${target_dir}/install.sh  << EOF
  --set virtualserver.enabled=true  \\
  --set virtualserver.host="\$ihost" \\
  --set virtualserver.tls.secret=\$cert \\
  --set virtualserver.ingressClassName=\$ingress_class 
EOF
fi

#Install-dry-test.sh generator
cat >  ${target_dir}/install-dry-test.sh  << EOF
is_test="--dry-run --debug"
. install.sh
EOF


#Common file generator
cat >  ${target_dir}/common  << EOF
name=$name
ns=$ns

ihost=$ihost
cloud_dbhost=$cloud_dbhost

cert=$cert
ext_ip=$ext_ip
ingress_class=$ingress_class
nginx_name=\$ingress_class
ext_port=$ext_port
crt=$crt
key=$key
EOF

cp -v ${installer_dir}/installer/values.yaml       ${target_dir}/values.yaml
cp -v ${installer_dir}/installer/kube-rollout.sh   ${target_dir}/kube-rollout.sh
cp -v ${installer_dir}/installer/kube-shell.sh     ${target_dir}/kube-shell.sh
cp -v ${installer_dir}/installer/show-logs.sh      ${target_dir}/show-logs.sh
cp -v ${installer_dir}/installer/show-rndnet-server-log.sh ${target_dir}/show-rndnet-server-log.sh
cp -v ${installer_dir}/installer/show-secret.sh    ${target_dir}/show-secret.sh
cp -v ${installer_dir}/installer/show-status.sh    ${target_dir}/show-status.sh
cp -v ${installer_dir}/installer/uninstall.sh      ${target_dir}/uninstall.sh
cp -v ${installer_dir}/installer/uninstall_all.sh  ${target_dir}/uninstall_all.sh
cp -v ${installer_dir}/installer/install_all.sh    ${target_dir}/install_all.sh

cd  ${target_dir}
#ln -sv ${installer_dir}/installer/kube-rollout.sh
##ln -sv ${installer_dir}/installer/README.md
#ln -sv ${installer_dir}/installer/kube-shell.sh
#ln -sv ${installer_dir}/installer/show-logs.sh
#ln -sv ${installer_dir}/installer/show-rndnet-server-log.sh
#ln -sv ${installer_dir}/installer/show-secret.sh
#ln -sv ${installer_dir}/installer/show-status.sh
#ln -sv ${installer_dir}/installer/uninstall.sh
#ln -sv ${installer_dir}/installer/uninstall_all.sh
#ln -sv ${installer_dir}/installer/install_all.sh


if [[ $is_create_nginx = y ]] ; then

  cp -rv ${installer_dir}/installer/nginx  ${target_dir}/

  # Nginx controller

  cat > nginx/install.sh  << EOF
# https://docs.nginx.com/nginx-ingress-controller/installation/installation-with-helm/
# helm repo add nginx-stable https://helm.nginx.com/stable
# helm repo update

. ../common

helm install \$nginx_name -n \$ns    --set controller.service.type="ClusterIP" \\
                             --set controller.service.externalIPs={\$ext_ip}  \\
                             --set controller.service.httpPort.enable=false \\
                             --set controller.service.httpsPort.enable=true --set controller.service.httpsPort.port=\$ext_port \\
                             --set controller.watchNamespace=\$ns \\
                             --set controller.ingressClass=\$ingress_class \\
                             --set controller.defaultTLS.secret=\$ns/\$cert \\
                              nginx-stable/nginx-ingress
EOF

  echo 
  echo "Do not forget add nginx helm repository!"
  echo "   helm repo add nginx-stable https://helm.nginx.com/stable"
  echo "   helm repo update"
  echo

  cat > nginx/uninstall.sh  << EOF
. ../common
helm delete \$nginx_name -n \$ns
EOF

fi



if [[ $is_cert_create = y ]] ; then

     nginx_cert_dir=${target_dir}/nginx/cert
     mkdir -p ${nginx_cert_dir}

     cat > ${nginx_cert_dir}/add-secret.sh << EOF
. ../../common
#kubectl create secret generic \$cert -n \$ns --from-file=tls.crt=\$crt --from-file=tls.key=\$key
kubectl create secret tls \$cert -n \$ns --cert=\$crt --key=\$key
EOF

     cat > ${nginx_cert_dir}/rm-secret.sh << EOF
. ../../common
kubectl delete secrets/\$cert -n \$ns
EOF

     cat > ${nginx_cert_dir}/show-secret.sh << EOF
. ../../common
kubectl get secret \$cert -n \$ns  -o jsonpath="{.data}"
EOF

fi


if [[ $helm_install_from_package = y ]] ; then
  echo 
  echo "Do not forget add rndnet helm repository!"
  echo "   helm repo add rndnet-charts https://server1.rndnet.net/helm/"
  echo "   helm repo update"
  echo
fi

echo "READ ME !!!!!!!!!!!"
echo "Go to "$target_dir" directory"
echo "Modify files with valid settings"
echo " - install.sh - database name, database port, database connection rules, rabbitmq connection string, mail server params and others."
echo " - values.yaml - host aliaces and multiline database connection rules"
