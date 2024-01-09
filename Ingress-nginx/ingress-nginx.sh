#!/bin/bash
K8SCLUSTER=sipgwpp-k8s
HELM_NS=ingress-nginx
HELM_REPO=https://kubernetes.github.io/ingress-nginx
HELM_NAME=ingress-nginx
HELM_REPONAME=ingress-nginx
CLUSTER_DOMAIN=sipgwpp-k8s.solusi-k8s.com
HELM_OPT=" --create-namespace "

# helm repo add ${HELM_REPONAME} ${HELM_REPO}
helm repo update

kubectl config use-context kubernetes-admin@${K8SCLUSTER} || exit

kubectl get ns ${HELM_NS} || kubectl create ns ${HELM_NS}

kubectl config use-context ${HELM_NS}@${K8SCLUSTER} && \
helm upgrade --install ${HELM_NAME} ${HELM_REPONAME} \
  --repo ${HELM_REPO} \
  --namespace ${HELM_NS}  \
  --set ingress.annotations."cert-manager\.io/cluster-issuer"="letsencrypt-x-k8s" \
  ${HELM_OPT} \
  --set fullnameOverride="${HELM_NAME}" \
  --set nameOverride="${HELM_NAME}" \
  --set controller.containerPort.http=80 \
  --set controller.containerPort.https=443 \
  --set controller.dnsPolicy="ClusterFirst" \
  --set controller.hostPort.enabled=true \
  --set controller.hostPort.ports.http=80 \
  --set controller.hostPort.ports.https=443 \
  --set controller.networkPolicy.enabled=false \
  --set controller.ingressClass="nginx" \
  --set controller.kind="Deployment" \
  --set controller.replicaCount=2 \
  --set controller.minAvailable=1 \
  --set controller.service.enabled=true \
  --set controller.service.loadBalancerIP="" \
  --set controller.service.enableHttp=true \
  --set controller.service.enableHttps=true \
  --set controller.service.ports.http=80 \
  --set controller.service.ports.https=443 \
  --set controller.service.type=LoadBalancer \
  --set controller.service.targetPorts.https=https \
  --set controller.service.targetPorts.http=http \
  --set controller.opentelemetry.enabled=false \
  --set controller.metrics.port=10254 \
  --set controller.metrics.enabled=false \
  --set controller.metrics.serviceMonitor.enabled=false \
  --set controller.metrics.serviceMonitor.namespace="" \
  --set controller.metrics.prometheusRule.enabled=false \
  --set revisionHistoryLimit=10 \
  --set defaultBackend.enabled=true \
  --set defaultBackend.image.registry=docker.io \
  --set defaultBackend.image.tag=1.0.1 \
  --set defaultBackend.port=8080 \
  --set defaultBackend.replicaCount=1 \
  --set defaultBackend.minAvailable=1 \
  --set rbac.create=true \
  --set serviceAccount.create=true \
  --values sipgwpp-k8s-values.yaml \

  # --set defaultBackend.image.image=solusik8s/ingress-nginx-backend \
  # --set commonLabels."platform"="myindo" \
  # --set commonLabels."environment"="production" \
  # --set controller.proxySetHeaders."X-Served-By"="Kemen" \
  # --set controller.nodeSelector."node\.solusi-k8s\.com/ingress-nginx"="true" \
  # --set 'controller.metrics.serviceMonitor.namespaceSelector={}' \
  # --set controller.service.loadBalancerSourceRanges=[] \
  # --set controller.electionID="ingress-controller-leader" \
  # --set ingress.annotations."cert-manager\.io/cluster-issuer"="letsencrypt-solusi-k8s" \
  # --values sipgwpp-k8s-values-v1.3.0.yaml \