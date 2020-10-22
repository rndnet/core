. common
#kubectl logs -l name=${POD_NAME} 
kubectl logs -l app=${POD_NAME} 

#n=$(kubectl get pods | grep rndnet-server | awk '{print $1}')
#kubectl logs $n 
