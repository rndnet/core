. common
n=$(kubectl get pods -n $ns | grep $name | awk '{print $1}')
kubectl exec --stdin --tty $n -n $ns  -- /bin/bash
