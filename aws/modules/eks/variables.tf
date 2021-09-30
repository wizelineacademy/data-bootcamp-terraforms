variable "region" {
  default     = "us-west-2"
  description = "AWS region"
}
variable "cluster_name" {
  description = "The name of the Airflow cluster (e.g. airflow-xyz). This variable is used to namespace all resources created by this module."
  type        = string
}

variable "cluster_version" {
  default     = "1.20"
  description = "Cluster version"
}

variable "vpc_id" {
  type = string
  description = "VPC where the cluster and workers will be deployed."
}

variable "subnets" {
  type = list(string)
  description = "A list of subnets to place the EKS cluster and workers within."
}

variable "instance_type_group1" {
  default     = "t2.small"
  description = "Instance type for the group 1"
}

variable "instance_type_group2" {
  default     = "t2.medium"
  description = "Instance type for the group 2"
}

variable "asg_desired_capacity_group1" {
  default     = 2
  description = "Desired capacity for autoscaling for the group 1"
}

variable "asg_desired_capacity_group2" {
  default     = 1
  description = "Desired capacity for autoscaling for the group 2"
}
