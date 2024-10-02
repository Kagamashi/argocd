# PROJECT MANAGEMENT
argocd proj create my-project \
    --description "Project for team A" \
    --repo https://github.com/my-org/allowed-repo \
    --dest https://kubernetes.default.svc,namespace-1

argocd proj list

argocd proj get my-project

argocd proj delete my-project
