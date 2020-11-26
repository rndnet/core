

cur_dir="$(pwd)"
target_dir="$(dirname "$cur_dir")"/rndnet-server-
read -e -p "Target dir:" -i ""${target_dir} target_dir 

mkdir -p ${target_dir}
#cp -v helm/install.sh          ${target_dir}/install.sh
#cp -v helm/install-dry-test.sh ${target_dir}/install-dry-test.sh
sed "s#./rndnet-server#${cur_dir}/helm/rndnet-server#g"  helm/install-dry-test.sh > ${target_dir}/install-dry-test.sh
sed "s#./rndnet-server#${cur_dir}/helm/rndnet-server#g"  helm/install.sh          > ${target_dir}/install.sh
cp -v helm/common              ${target_dir}/common
cp -v helm/values.yaml         ${target_dir}/values.yaml

cd  ${target_dir}
ln -sv ${cur_dir}/helm/kube-rollout.sh
#ln -sv ${cur_dir}/helm/README.md
ln -sv ${cur_dir}/helm/kube-shell.sh
ln -sv ${cur_dir}/helm/show-logs.sh
ln -sv ${cur_dir}/helm/show-rndnet-server-log.sh
ln -sv ${cur_dir}/helm/show-secret.sh
ln -sv ${cur_dir}/helm/show-status.sh
ln -sv ${cur_dir}/helm/uninstall.sh

