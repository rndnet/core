. common

cmd="kubectl get pods -n $ns  | grep ^$name | awk '{print \$1}' "

c=$(eval "$cmd | wc -l")

if [ $c -gt 1 ]; then
  eval "$cmd"
  echo Too much server pod instances found [$c], but 1 expected!
  echo Failed!
  exit
fi

n=$(eval "$cmd")
echo $n
kubectl exec --stdin --tty -n $ns $n  -- cat /var/log/rndnet_server.log
kubectl exec --stdin --tty -n $ns $n  -- cat /var/log/rndnet_server_err.log
