# Managing Applications via CLI
argocd app create my-app \
    --repo https://github.com/my-org/my-app-repo.git \
    --path manifests \
    --dest-server https://kubernetes.default.svc \
    --dest-namespace my-app-namespace \
    --sync-policy automated

argocd app sync my-app

argocd app get my-app

argocd app wait my-app # this cmd wait until app reaches a synced and healthy state

argocd app rollback my-app --revision <commit-id>

argocd app delete my-app
