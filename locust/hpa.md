# Setup HPA

## Install Metric Server
(https://github.com/kubernetes-sigs/metrics-server#deployment)

`kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml`

## commnd to setup HPA
`kubectl autoscale deployment <deploy-name> --cpu-percent=50 --min=1 --max=10`
