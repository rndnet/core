. common
#kubectl exec --stdin --tty ${POD_NAME} -- /bin/bash
n=$(kubectl get pods | grep rndnet-server | awk '{print $1}')

kubectl exec --stdin --tty $n  -- cat /var/log/rndnet_server.log

kubectl exec --stdin --tty $n  -- cat /var/log/rndnet_server_err.log
