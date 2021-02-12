. ../common
n=$(kubectl get pods -n $ns | grep $nginx_name | awk '{print $1}')
kubectl exec --stdin --tty $n -n $ns  -- /bin/bash
