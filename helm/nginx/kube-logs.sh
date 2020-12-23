. ../common
n=$(kubectl get pods -n $ns | grep $nginx_name | awk '{print $1}')
kubectl logs $n -n $ns
