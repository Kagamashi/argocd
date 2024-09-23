ArgoCD RBAC policies are managed via argocd-rbac-cm ConfigMap, located in argocd namespace

apiVersion: v1
kind: ConfigMap
metadata:
  name: argocd-rbac-cm
  namespace: argocd
data:
  policy.csv: |
    p, role:admin, applications, *, */*, allow
    p, role:dev, applications, get, */*, allow
    p, role:viewer, applications, get, argocd/*, allow
    g, admin@example.com, role:admin
    g, dev@example.com, role:dev
    g, viewer@example.com, role:viewer

---

RBAC in ArgoCD can be scoped to specific projects so users can only acccess applications within a particular project

apiVersion: argoproj.io/v1alpha1
kind: AppProject
metadata:
  name: example-project
spec:
  roles:
  - name: dev-role
    policies:
    - p, role:dev-role, applications, *, example-project/*, allow
  - name: viewer-role
    policies:
    - p, role:viewer-role, applications, get, example-project/*, allow

---

SSO
1. OAuth2/OpenID Connect (OIDC) Integration

*argocd-cm ConfigMap*
apiVersion: v1
kind: ConfigMap
metadata:
  name: argocd-cm
  namespace: argocd
data:
  oidc.config: |
    name: Google
    issuer: https://accounts.google.com
    clientID: <CLIENT_ID>
    clientSecret: <CLIENT_SECRET>
    requestedIDTokenClaims:
      email:
        essential: true
    requestedScopes: ["openid", "profile", "email"]
