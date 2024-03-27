# Install using Helm

## Add helm repo
(https://prometheus-community.github.io/helm-charts/)

`helm repo add prometheus-community https://prometheus-community.github.io/helm-charts`

## Update helm repo

`helm repo update`

## Create namespace for monitoring stack
 `kubectl create ns monitoring`

## Install stack

`helm install monitoring prometheus-community/kube-prometheus-stack -n monitoring`

## Initial paasword for grafana

`kubectl get secret --namespace monitoring monitoring-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo`
