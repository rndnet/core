cur_dir=$(pwd)
cert_script=nginx/cert/rm-secret.sh
if test -f "$cert_script"; then
  bash $cert_script
fi

nginx_script=nginx/uninstall.sh
if test -f "$nginx_script"; then
  cd nginx
  bash uninstall.sh
fi

cd ${cur_dir}
bash uninstall.sh

