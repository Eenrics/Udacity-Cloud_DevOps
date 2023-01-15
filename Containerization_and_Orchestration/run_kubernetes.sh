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

# Running kubectl

# Your dockerUserName/ContainerName
dockerpath="noahgift/flasksklearn"

# Run in Docker Hub container with kubernetes
kubectl run flaskskearlndemo\
    --generator=run-pod/v1\
    --image=$dockerpath\
    --port=80 --labels app=flaskskearlndemo

# List kubernetes pods
kubectl get pods

# Forward the container port to host
kubectl port-forward flaskskearlndemo 8000:80

# Debugging

# Check if the pod is running 
kubectl get pods

# Get more information about that pod. Find the Events header. This should give you a Reason and Message related to the failure.
kubectl describe pod <POD NAME>

# What is the pod is working & there is likely an issue with the specific node that needs to be debugged.

# Get nodes and check the Ready Status of the node
kubectl get nodes

# Get more information about that node.
kubectl describe node <NODE NAME>

