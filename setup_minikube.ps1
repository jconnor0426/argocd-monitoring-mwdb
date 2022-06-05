# Create the Cluster
minikube start --nodes 3 -p mwdb-cicd

# Install ArgoCD 
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/ha/install.yaml

# Start Port Forwarding For ArgoCD
kubectl port-forward svc/argocd-server -n argocd 8080:443
