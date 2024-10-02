# SYNC POLICIES
- **Self Heal**: if enabled, ArgoCD will automatically correct any drift between the desired state (Git) and live state (K8s cluster) by reapplying the desired state
- **Pruning**: automatically removes resources that are present in Kubernetes cluster but no longer exist in Git repository

 syncPolicy:
    automated:
      prune: true           # Automatically remove resources no longer defined in Git
      selfHeal: true         # Automatically correct drift between the cluster and Git
    syncOptions:
      - CreateNamespace=true  # Automatically create namespace if it doesn’t exist
      - PrunePropagationPolicy=foreground  # Controls how resources are deleted
      - SyncTimeout=300  # Timeout in seconds (300 seconds = 5 minutes)


# SYNC PHASES
- PreSync: custom logic or tasks can be defined to run before sync process starts
- Sync: ArgoCD applies Kubernetes resources from Git repository to cluster
- PostSync: custom logic/tasks to run after sync process is completed
<!-- apiVersion: batch/v1
kind: Job
metadata:
  name: pre-sync-job
  annotations:
**    argocd.argoproj.io/hook: PreSync  # Run this job before the sync starts**
spec:
  template:
    spec:
      containers:
        - name: my-job
          image: my-job-image
      restartPolicy: OnFailure
 -->

# SYNC OPTIONS
- Allow Empty: allows syncing applications without any resources defined
- Prune Resources: deletes resources that exist in the cluster but no longer exist in Git
- Force Sync: forces the application to be synchronized, even if it's already in sync


# SYNC WAVES
ArgoCD allows you to define sync waves to control the order in which resources are applied. Resources in lower waves are applied before those in higher waves, which is useful for managing dependencies (e.g., services before deployments).
<!-- apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-app
  annotations:
**    argocd.argoproj.io/sync-wave: "1"  # Apply this resource in sync wave 1**
spec:
  replicas: 3
  template:
    spec:
      containers:
        - name: my-app-container
          image: my-app:latest -->
