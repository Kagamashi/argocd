  1. Declarative approach
  2. Use Git version control system
  3. GitOps operator automatically pulls desired state from Git
  4. Reconcilation - self-healing system - operator goes through 3 steps: Observe -> Diff -> Act

GitOps Features:
  • Automated deployment of application to specified target environment in multiple clusters
  • SSO integration (OIDC, oAtuh2, LDAP, Gitlab..)
  • Webhook integration (GitHub, BitBucket, GitLab)
  • Rollback/Roll-anywhere to any app config commited in Git repo
  • Audit trails for app events and API calls
  • Web UI which provides real-time view of apps activity
  • Automated config drift detection and visualization
  • Out-of-the-box Prometheus metrics
  • Support multiple config management/template tools (Kustomize, Helm, Ksonnet, Jsonnet)
  • PreSync, Sync, PostSync hooks to support complex app rollout (blue/gren, canary)
  • Multi-tenancy and RBAC policies for authorzation
  • CLI and access tokens for automation and CI integration
  • Automated or Manual syncing of app to desired state

GitOps Tools:
  - https://argoproj.github.io/cd/
  - https://fluxcd.io/flux/
Atlantis, Flagger, Faros, GitKube, HELM Operator…