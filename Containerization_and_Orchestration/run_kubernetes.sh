# To start claster
minikube start

# To get information about clusters
kubectl cluster-info

# To get nodes
kubectl get nodes

# To list of deployed apps running on Kubernetes
kubectl get deployments

# If you had one Kubernetes app "test-app" running, and to scale the app up to 6 application instances
kubectl scale deployments/test-app --replicas=6

# Getting the logs from a running pod
kubectl logs <pod-name>
