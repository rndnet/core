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
kubectl logs $n -n $ns
