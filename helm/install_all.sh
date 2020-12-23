set -euo pipefail

echo "Add secret"
cur_dir=$(pwd)
cert_script=nginx/cert/add-secret.sh
if test -f "$cert_script"; then
  cd nginx/cert
  bash add-secret.sh
fi

echo
echo "Install nginx ingress controller"
cd ${cur_dir}

nginx_script=nginx/install.sh
if test -f "$nginx_script"; then
  cd nginx
  bash install.sh
fi

echo
echo "Install rndnet server"
cd ${cur_dir}
bash install.sh

