. common

echo deployments
kubectl get deployments -n $ns -o wide  | grep -e NAME -e $name
echo svc
kubectl get svc -n $ns -o wide | grep -e NAME -e $name
echo pods
kubectl get pods -n $ns -o wide  | grep -e NAME -e $name
echo ep
kubectl get ep -n $ns  | grep -e NAME -e $name
echo vs
kubectl get vs -n $ns | grep -e NAME -e $name
echo secrets
kubectl get secrets -n $ns | grep -e NAME -e $name
