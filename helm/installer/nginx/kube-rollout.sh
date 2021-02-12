. ../common
n=$(kubectl get deployment -n $ns | grep $nginx_name | awk '{print $1}')
kubectl rollout restart deployment.apps/$n -n $ns
