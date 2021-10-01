variable "region" {
  description = "AWS Deployment region.."
}

### Networking ###

variable "vpc_cidr" {
  type = string
}

variable "public_subnets_cidr" {
  type = string
}

variable "private_subnets_cidr" {
  type = string
}

### RDS ###

variable "allocated_storage" {
  description = "Space in disk for the database, stay in the range 5-10 to stay in free tier"
}
variable "db_engine" {
  description = "Database instance type"
}
variable "engine_version" {
  description = "Engine version"
}
variable "instance_type" {
  description = "Type for the rds instance, set db.t3.micro to stay in the free tier"
}
variable "database_name" {
  description = "Name for the rds database"
}
variable "db_username" {
  description = "Username credentials for root user"
}
variable "db_password" {
  description = "Password credentials for root user"
}
variable "private_subnet" {
  description = "Private subnet where the rds instance is going to be placed"
}
variable "service_sg" {
  description = "Security group of the service which is going to connect to the database"
}
variable "publicly_accessible" {
  description = "Variable that set the instance to be accessible publicly"
}

### EC2 ###

variable "ec2_name" {
  description = "The Name of the EC2"
  type        = string
}

variable "ec2_security_group_name" {
  description = "The Name of the EC2 Security Group"
  type        = string
}

variable "ec2_security_group_description" {
  description = "The Description of the EC2 Security Group"
  type        = string
}

variable "ec2_ami" {
  description = "The Amazon Machine Image"
  type        = string
}

variable "ec2_instance_type" {
  description = "The EC2 Instance type"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the Public Subnet"
  type        = string
}

variable "ec2_ssh_key_name" {
  description = "The SSH Key Name"
  type        = string
}

variable "ec2_ssh_public_key_path" {
  description = "The local path to the SSH Public Key"
  type        = string
}

variable "subnet_id" {
  description = ""
  type        = string
}

variable "cluster_name" {
  description = "The name of the Airflow cluster (e.g. airflow-xyz). This variable is used to namespace all resources created by this module."
  type        = string
}

### S3 ###
variable "bucket_prefix" {
  type = string
}

variable "acl" {
  type = string
}

variable "versioning" {
  type = bool
}

### eks ###
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
  type        = string
  description = "VPC where the cluster and workers will be deployed."
}

variable "subnet" {
  type        = string
  description = "The private subnet to place the EKS cluster and workers within."
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