# WEBHOOKS
Used in ArgoCD to trigger immediate syncs when changes occur in Git repository.
Insteaf of waiting for periodic reconciliation loop, webhooks enable faster response times to repository updates.

1. Set up a webhook in your repository:
- URL: https://<ARGOCD_SERVER>/api/webhook
- Content type: application/json
- Secret: Set a secret key to secure your webhook.

2. Add shared secret in ArgoCD
<!-- apiVersion: v1
kind: Secret
metadata:
  name: argocd-webhook-secret
  namespace: argocd
data:
  webhook.secret: <BASE64_ENCODED_SECRET> -->

3. Enable webhook supports in application
<!-- apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: my-app
  namespace: argocd
spec:
  source:
    repoURL: https://github.com/my-org/my-app
    path: manifests/
  destination:
    server: https://kubernetes.default.svc
    namespace: production
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    webhook:
      secretName: argocd-webhook-secret  # Use the shared secret for validation -->
