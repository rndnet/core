. common
n=$(kubectl get pods -n $ns | grep $name | awk '{print $1}')
kubectl logs $n -n $ns
