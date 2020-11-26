. common
kubectl get all -o wide -n $ns | grep -e NAME -e $name
kubectl get secrets -n $ns | grep -e NAME -e $name
kubectl get vs -n $ns | grep -e NAME -e $name
kubectl get ep -n $ns | grep -e NAME -e $name
