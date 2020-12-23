. ../common

echo deployments
kubectl get deployments -n $ns -o wide  | grep -e NAME -e $nginx_name
echo svc
kubectl get svc -n $ns -o wide | grep -e NAME -e $nginx_name
echo pods
kubectl get pods -n $ns -o wide  | grep -e NAME -e $nginx_name
echo ep
kubectl get ep -n $ns  | grep -e NAME -e $nginx_name
echo vs
kubectl get vs -n $ns | grep -e NAME -e $nginx_name
echo secrets
kubectl get secrets -n $ns | grep -e NAME -e $nginx_name
