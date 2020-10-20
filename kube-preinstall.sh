#cd ca; bash 0-add-config-as-secret.sh
kubectl apply -f ca/1-add-nodeport-service.yaml

kubectl get secrets
kubectl get services
kubectl get svc
kubectl get clusterroles
kubectl get clusterrolebindings

