installer_dir="$(pwd)"

read -e -p "New scheduler name:" -i "rndnet-sheduler-" name
target_dir="$(dirname $(dirname "$installer_dir"))"/$name

read -e -p "Target dir:" -i ""${target_dir} target_dir
read -e -p "Namespace: " -i "default" ns 
read -e -p "Server url: " -i "https://yourserver.yourdomain:5000" server
read -e -p "Scheduler user name: " -i "scheduler_user" user
read -e -p "Scheduler user key file: " -i "rndnet_scheduler.key" key
read -e -p "Scheduler params: " -i "{docker_image=rndnet/python-bfj:latest,gpu_vendor=nvidia}" params


read -e -p "Install from helm package (y) or from helm sources [any]? " -i "y"  helm_install_from_package
if [[ $helm_install_from_package = y ]] ; then
  read -e -p "Define helm repository name: " -i "rndnet-charts"  helm_install_prefix
else
  read -e -p "Define helm sources path: " -i ${installer_dir} helm_install_prefix
fi

mkdir -p ${target_dir}

# Common file generator
cat >  ${target_dir}/common  << EOF
name=$name
ns=$ns

server=$server
user=$user
key=$key
params=$params
EOF

# Install.sh generator
cat >  ${target_dir}/install.sh  << EOF
. common

helm install -name \$name  \$is_test -n \$ns $helm_install_prefix/rndnet-scheduler \\
 --set scheduler.server=\$server \\
 --set scheduler.user=\$user \\
 --set scheduler.params="\$params" \\
 --set-file scheduler.key=\$key  \\
 --set nameOverride=$name

EOF


cp -v ${installer_dir}/installer/install-dry-test.sh ${target_dir}/install-dry-test.sh
cp -v ${installer_dir}/installer/kube-rollout.sh     ${target_dir}/kube-rollout.sh
cp -v ${installer_dir}/installer/kube-shell.sh       ${target_dir}/kube-shell.sh
cp -v ${installer_dir}/installer/show-logs.sh        ${target_dir}/show-logs.sh
cp -v ${installer_dir}/installer/show-secret.sh      ${target_dir}/show-secret.sh
cp -v ${installer_dir}/installer/show-status.sh      ${target_dir}/show-status.sh
cp -v ${installer_dir}/installer/uninstall.sh        ${target_dir}/uninstall.sh
