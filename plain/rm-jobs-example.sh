
kubectl get pods
echo
read -p "Enter pods identificator for batch remove: " p

kubectl get pods | grep rndnet-$p | awk '{print $1}' | xargs kubectl delete pods
kubectl get jobs | grep rndnet-$p | awk '{print $1}' | xargs kubectl delete jobs
