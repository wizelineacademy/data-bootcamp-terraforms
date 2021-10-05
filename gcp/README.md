# terraform-gcp-gke-airflow


The current architecture was implemented following this guide [Provision a GKE Cluster guide](https://learn.hashicorp.com/tutorials/terraform/gke?in=terraform/kubernetes)

### Prerequisites

- GCP account configured. 
- Helm 3

#### Dependencies
- gcloud cli
- Cluster version: 1.20 
- Terraform >= 0.13

### Installing

To have K8s cluster running:

Execute Terraform commands:

```
terraform init
```
```
terraform apply --var-file=terraform.tfvars
```
Once that the cluster is created, set the kubectl context:

```
gcloud container clusters get-credentials $(terraform output -raw kubernetes_cluster_name) --region $(terraform output -raw region)
```

To destroy the EKS cluster, we run:

```
terraform destroy --var-file=terraform.tfvars
```


## For Helm 

Here we are using official Airflow helm chart as example, but, can also been installed any other Airflow distribution.

Create the namespace
```
kubectl create namespace airflow
```

Add the chart repository and confirm:
```
helm repo add apache-airflow https://airflow.apache.org
```
Install the airflow chart from the repository:
```
helm install airflow apache-airflow/airflow --namespace airflow
```
We can verify that our pods are up and running by executing:
```
kubectl get pods -n airflow
```

### Accessing to Airflow dashboard

The Helm chart shows how to connect:
```
You can now access your dashboard(s) by executing the following command(s) and visiting the corresponding port at localhost in your browser:

Airflow Webserver:     kubectl port-forward svc/airflow-webserver 8080:8080 --namespace airflow
Flower dashboard:      kubectl port-forward svc/airflow-flower 5555:5555 --namespace airflow
Default Webserver (Airflow UI) Login credentials:
    username: admin
    password: admin
Default Postgres connection credentials:
    username: postgres
    password: postgres
    port: 5432

You can get Fernet Key value by running the following:

    echo Fernet Key: $(kubectl get secret --namespace airflow airflow-fernet-key -o jsonpath="{.data.fernet-key}" | base64 --decode)
```

## Acknowledgments

This solution was based on this guide: [Provision a GKE Cluster guide](https://learn.hashicorp.com/tutorials/terraform/gke?in=terraform/kubernetes), containing
Terraform configuration files to provision an GKE cluster on GCP.