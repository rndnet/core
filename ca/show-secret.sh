kubectl get secret rndnet-server-data -o jsonpath="{.data.conf}" | base64 --decode
kubectl get secret rndnet-server-data -o jsonpath="{.data.pgpass}" | base64 --decode
