kubectl apply -f ./Kubernetes/capstone-cluster-ip-service.yaml
kubectl apply -f ./Kubernetes/capstone-deployment.yaml
kubectl apply -f ./Kubernetes/capstone-nodeport.yaml
kubectl apply -f ./Kubernetes/jenkins-deployment.yaml
kubectl apply -f ./Kubernetes/jenkins-node-port.yaml
kubectl apply -f ./Kubernetes/ingress-service.yaml