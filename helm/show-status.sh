. common
kubectl get all -o wide -n $ns | grep -e NAME -e $name
echo
echo secrets
kubectl get secrets -n $ns | grep -e NAME -e $name
echo
echo cluster roles
kubectl get clusterroles -n $ns | grep -e NAME -e $name
echo
echo cluster roles bindings
kubectl get clusterrolebindings -n $ns | grep -e NAME -e $name
echo
echo service accounts
kubectl get sa -n $ns  | grep -e NAME -e $name
echo
echo endpoints
kubectl get ep -n $ns | grep -e NAME -e $name
