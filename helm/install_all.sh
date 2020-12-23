set -euo pipefail

cur_dir=$(pwd)
cert_script=nginx/cert/add-secret.sh
if test -f "$cert_script"; then
  bash $cert_script
fi

nginx_script=nginx/install.sh
if test -f "$nginx_script"; then
  cd nginx
  bash install.sh
fi

cd ${cur_dir}
bash install.sh

