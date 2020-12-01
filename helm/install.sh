. common 
 
helm install -name $name  -n $ns ./rndnet-scheduler \
 --set scheduler.server='https://yourserver.yourdomain:5000' \
 --set scheduler.user='rndnet_scheduler_user_name' \
 --set scheduler.params="{docker_image=rndnet/python-bfj:latest,gpu_vendor=nvidia}" \
 --set-file scheduler.key=rndnet_scheduler.key

# --set resources.limits.memory='16Gi' \
# --set resources.limits.cpu=20 \
# --set resources.requests.memory='2Gi' \
# --set resources.requests.cpu=10 \ 

# --set scheduler.params="" \
# --set serviceAccount.create=false \
# --set scheduler.type="mp" \
# --set scheduler.command="{'your_command'}" \
# --set image.repository="your_repository" \
# --set image.tag="your-repository-tag" \
