# Creates a new application in ArgoCD by pulling configuration from a Git repository.
argocd app create my-app \
    --repo https://github.com/my-org/my-app-repo.git \
    --path manifests \
    --dest-server https://kubernetes.default.svc \
    --dest-namespace my-app-namespace \
    --sync-policy automated

# Manually syncs an application, applying the latest changes from the Git repository to the Kubernetes cluster.
argocd app sync my-app

# Retrieves detailed information about a specific ArgoCD application.
argocd app get my-app

# Lists all applications managed by ArgoCD.
argocd app list

# Waits until the application reaches a synced and healthy state.
argocd app wait my-app # this cmd wait until app reaches a synced and healthy state

# Rolls back an application to a previous revision.
argocd app rollback my-app --revision [commit-id]

# Deletes an application from ArgoCD along with the associated Kubernetes resources.
argocd app delete my-app
