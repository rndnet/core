. common
n=$(kubectl get pods -n $ns | grep $name | awk '{print $1}')
kubectl exec --stdin --tty -n $ns $n  -- /bin/bash
