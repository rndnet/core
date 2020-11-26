. common
kubectl get secret  $name -o yaml -n $ns

kubectl get secret $name -o jsonpath="{.data.conf}" -n $ns | base64 --decode
echo
echo
kubectl get secret $name -o jsonpath="{.data.pgpass}" -n $ns | base64 --decode
