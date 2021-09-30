# terraform-aws-eks-airflow


The current architecture was implemented following this guide [Provisioning an EKS Cluster guide](https://learn.hashicorp.com/terraform/kubernetes/provision-eks-cluster)

### Prerequisites

- AWS account configured. For this example we are using default profile and us-east-2 region
- Helm 3

#### Dependencies
- aws cli
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
aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)
```

Create a namespace for airflow deployment:
```
kubectl create namespace airflow
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

This solution was based on this guide: [Provision an EKS Cluster learn guide](https://learn.hashicorp.com/terraform/kubernetes/provision-eks-cluster), containing
Terraform configuration files to provision an EKS cluster on AWS.