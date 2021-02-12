. common
#kubectl get secret -n $ns  $name -o yaml -n $ns

kubectl get secret -n $ns $name -o jsonpath="{.data.key}" -n $ns | base64 --decode
