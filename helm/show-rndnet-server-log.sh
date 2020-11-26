. common
n=$(kubectl get pods -n $ns | grep $name | awk '{print $1}')
echo $n
kubectl exec --stdin --tty -n $ns $n  -- cat /var/log/rndnet_server.log

kubectl exec --stdin --tty -n $ns $n  -- cat /var/log/rndnet_server_err.log
