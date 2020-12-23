. common
n=$(kubectl get deployment -n $ns | grep $name | awk '{print $1}')
kubectl rollout restart deployment.apps/$n -n $ns
