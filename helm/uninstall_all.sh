cur_dir=$(pwd)

cert_script=nginx/cert/rm-secret.sh
if test -f "$cert_script"; then
  echo "Remove secret"
  cd nginx/cert
  bash rm-secret.sh
  echo
fi

cd ${cur_dir}
nginx_script=nginx/uninstall.sh
if test -f "$nginx_script"; then
  echo "Uninstall nginx ingress controller"
  cd nginx 
  bash uninstall.sh
  echo
fi

cd ${cur_dir}
echo "Uninstall rndnet server"
bash uninstall.sh
