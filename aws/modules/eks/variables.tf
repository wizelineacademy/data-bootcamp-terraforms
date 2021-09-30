variable "region" {
  default     = "us-west-2"
  description = "AWS region"
}
variable "cluster_name" {
  description = "The name of the Airflow cluster (e.g. airflow-xyz). This variable is used to namespace all resources created by this module."
  type        = string
}

variable "vpc_id" {
  type = string
  description = "VPC where the cluster and workers will be deployed."
}

variable "subnets" {
  type = list(string)
  description = "A list of subnets to place the EKS cluster and workers within."
}