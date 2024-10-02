# Logging into ArgoCD Server
argocd login [ARGOCD_SERVER]
argocd login argocd.example.com

argocd logout [ARGOCD_SERVER]

# argocd-initial-admin-secret in argocd namespace
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
