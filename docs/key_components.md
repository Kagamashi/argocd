API SERVER : provides interface through which users interact with ArgoCD
- exposes REST API and CLI commands for users to manage and monitor applications
- serves ArgoCD web user interface (UI)
- authenticates users and ensures proper access control via RBAC
When we issue commands (via CLI or UI) they go through API server, which then triggers appropriate actions by interacting with repository server OR application controller


REPOSITORY SERVER : manages and caches Git repository content
- fetches application manifests (YAML files) from defined Git repositories
- parses the manifests and store them in cache for efficient access by other components
- validates repository structure and retrieves the current state of the application from the Git repository
Whenever ArgoCD needs to sync or validate the application state, the repository server is responsible for fetching the most up-to-date manifest files.


APPLICATION CONTROLLER : reconciles the desired state (from Git) with the actual state (in Kubernetes)
- watches for changes in both Git repository and Kubernetes cluster
- continuously compares the desired application state (defined in Git) with the live state in the cluster
- triggers sync operations to bring the actual state in Kubernetes in line with the desired state when differences are detected
- manages application health status, ensuring that reosurces are healthy, synced, ornotifying if they fall into error states
Application Controller is heart of ArgoCD reconciliation loop. It communicates with both the Git repository (via repository server) and Kubernetes API to ensure the live state of applications matches the Git-declared state


DEX : provides single sign-on authentication
- manages OAuth/OIDC integration with providers like Google, GitHub or enterprise SSO
- supports external identity management for user authentication


EXAMPLE GITOPS WORKFLOW WITH ARGOCD:
1. Developer commits new configuration or application code changes (YAML, Helm, etc.) to the Git repository.
2. ArgoCD detects the commit and fetches the latest configuration through the repository server.
3. Application Controller compares the new desired state from Git with the actual state in Kubernetes.
4. Syncing: If there’s a difference, ArgoCD synchronizes the cluster by applying changes to Kubernetes through the Kubernetes API.
5. Status Monitoring: ArgoCD monitors the health and status of the deployment, ensuring it remains in sync and healthy.