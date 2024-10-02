# Adds a new Git repository to ArgoCD for sourcing application configurations.
argocd repo add [REPO_URL] --username [USERNAME] --password [PASSWORD]

argocd repo add https://github.com/my-org/my-repo.git --username my-user --password my-password
