. common
#kubectl logs -l app=${name} 

n=$(kubectl get pods | grep ${name} | awk '{print $1}')
kubectl logs $n 
