. ../common
n=$(kubectl get pods -n $ns | grep $nginx_name | awk '{print $1}')
kubectl exec --stdin --tty $n  -n $ns -- ls  /etc/nginx/conf.d/
read -p "Enter conf name: " conf
kubectl exec --stdin --tty $n  -n $ns -- cat /etc/nginx/conf.d/$conf
#kubectl exec --stdin --tty $n  -n $ns -- cat /etc/nginx/conf.d/vs_default_rndnet-server.conf
