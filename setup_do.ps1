# Create the Cluster
doctl k8s cluster create mwdb-cluster `
    --auto-upgrade=false `
    --maintenance-window "saturday=21:00" `
    --node-pool "name=basicnp;size=s-4vcpu-8gb-amd;count=3;tag=cluster2;label=type=basic;auto-scale=true;min-nodes=2;max-nodes=4" `
    --region nyc1

# Install ArgoCD 
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/ha/install.yaml

# Start Port Forwarding For ArgoCD
kubectl port-forward svc/argocd-server -n argocd 8080:443
