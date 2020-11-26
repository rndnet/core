. common 
kubectl apply -f ${POD_NAME}.yaml

./kube-state.sh
kubectl describe pods ${POD_NAME}

