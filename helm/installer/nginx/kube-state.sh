. ../common

echo
echo deployments
kubectl get deployments -n $ns -o wide  | grep -e NAME -e $nginx_name
echo
echo svc
kubectl get svc -n $ns -o wide | grep -e NAME -e $nginx_name
echo
echo pods
kubectl get pods -n $ns -o wide  | grep -e NAME -e $nginx_name
echo
echo ep
kubectl get ep -n $ns  | grep -e NAME -e $nginx_name
echo
echo vs
kubectl get vs -n $ns | grep -e NAME -e $name
echo
echo secrets
kubectl get secrets -n $ns | grep -e NAME -e $nginx_name
