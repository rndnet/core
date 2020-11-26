echo
kubectl get deployments -o wide  | grep -e NAME -e rndnet-server 
echo
kubectl get svc -o wide | grep -e NAME -e rndnet-server 
echo
kubectl get pods -o wide  | grep -e NAME -e rndnet-server
echo 
kubectl get ep  | grep -e NAME -e rndnet-server
echo
kubectl get secrets | grep -e NAME -e rndnet-server