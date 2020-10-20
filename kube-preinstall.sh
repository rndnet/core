#https://gitlab.com/rndnet/apps/scheduler/-/tree/master/k8s

#bash ca/0-add-key-as-secret.sh
kubectl apply -f ca/1-scheduler-account.yaml
kubectl apply -f ca/2-list-nodes.yaml
kubectl apply -f ca/3-scheduler-list-nodes.yaml
kubectl apply -f ca/4-manage-jobs.yaml
kubectl apply -f ca/5-scheduler-manage-jobs.yaml
kubectl apply -f ca/6-list-pods.yaml
kubectl apply -f ca/7-scheduler-list-pods.yaml

kubectl get sa
kubectl get secrets
kubectl get clusterroles
kubectl get clusterrolebindings

