. common
#kubectl get secret -n $ns  $name -o yaml -n $ns

kubectl get secret -n $ns $name -o jsonpath="{.data.conf}" -n $ns | base64 --decode
echo
echo
kubectl get secret -n $ns $name -o jsonpath="{.data.pgpass}" -n $ns | base64 --decode
