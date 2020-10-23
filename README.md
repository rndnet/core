# Core:scheduler

Use rndnet-scheduler on kubernetes 


Build image (optionally)
--------------------------

1. cd image
2. ./build-upload.sh

    
Install on kubernetes 
---------------------------

1. Put valid rndnet scheduler key to `ca` directory as `rndnet_scheduler.key` or modify with valid key file name
2. cd images; bash ca/0-add-key-as-secret.sh 
3. ./kube-preinstall.sh

4. Modify `--server` and `--user` params in containers `args` string in `kuber-rndnet-scheduler.yaml`
5. If cluster has AMD GPUs then add `gpu_vendor=amd`in containers `args` string in `kuber-rndnet-scheduler.yaml`

6. Run kube-install.sh
