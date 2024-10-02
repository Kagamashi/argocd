# HEALTH STATES

**Healthy**: The resource is fully operational and meets the desired state.
Example: A Deployment is marked as healthy when all its replicas are up and running as expected.

**Progressing**: The resource is being updated or created but is not yet fully operational.
Example: A StatefulSet that is still scaling up or rolling out an update might be marked as progressing.

**Degraded**: The resource is not functioning correctly, and intervention may be required.
Example: A Pod in CrashLoopBackOff or a Deployment that has failed to deploy its replicas.

**Missing**: The resource is expected but is not found in the cluster.
Example: ArgoCD expects a Deployment to exist, but it cannot find it in the cluster.

**Suspended**: The resource is paused or intentionally not running.
Example: A Job that has been manually suspended by an administrator.

**Unknown**: The health status of the resource could not be determined.
Example: A custom resource without a custom health check might be marked as "unknown."

## Built-in Health Checks
- Deployments: Marked healthy when all replicas are available and the desired number of Pods are running.
- StatefulSets: Marked healthy when the desired number of replicas are running.
- DaemonSets: Marked healthy when all Pods are running on the appropriate nodes.
- Services: Marked healthy when the endpoints are correctly serving traffic.
- Ingress: Marked healthy when the desired number of ingress rules are correctly configured and active.

## Custom Health Check
ArgoCD also supports custom health checks written in LUA (lightweight scripting language)

apiVersion: v1
kind: ConfigMap
metadata:
  name: argocd-cm
  namespace: argocd
data:
  resource.customizations.health.customresourcedefinition/mycustomresource: |
    hs = {}
    if obj.status ~= nil then
      if obj.status.phase == "Running" then
        hs.status = "Healthy"
      elseif obj.status.phase == "Pending" then
        hs.status = "Progressing"
      else
        hs.status = "Degraded"
      end
    else
      hs.status = "Unknown"
    end
    return hs

Explanation:
- **resource.customizations.health.customresourcedefinition/mycustomresource**: This defines a custom health check for a CRD called **mycustomresource**.
- Lua script: The health check script evaluates the **status.phase** field of the custom resource. If it is **Running**, the resource is marked as healthy, while **Pending** means progressing, and any other phase is considered degraded.
