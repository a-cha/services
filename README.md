# Services

###### _Setting up a multi-service cluster using Kubernetes_

### The cluster contains:
- Nginx
- WordPress
- PhpMyAdmin
- FTPS
- Grafana (+ InfluxDB)

Each service run in a dedicated container. 

Kubernetes (minikube) cluster configured as shown on the scheme:

<img src="https://user-images.githubusercontent.com/81406370/121785873-14080d80-cbc5-11eb-9b3f-9ceb3a2a7a42.jpeg" width="600" />

## Usage

Run `setup.sh` script to up the cluster and launch Kubernetes dashboard. Now you can use all this services. 

Also, there are possibility to reload cluster by `./setup.sh re kube` or reload certain service (for example, `./setup.sh re grafana`).
