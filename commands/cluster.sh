# Adds a Kubernetes cluster to ArgoCD so that ArgoCD can deploy applications to that cluster.
argocd cluster add [CONTEXT_NAME]
# context name corresponds to kubernetes context in local kubeconfig

# Lists all Kubernetes clusters connected to ArgoCD.
argocd cluster list

# Removes a Kubernetes cluster from ArgoCD.
argocd cluster rm [CONTEXT_NAME]
