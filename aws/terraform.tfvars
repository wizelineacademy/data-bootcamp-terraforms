region = "us-east-2"

#### Networking variables ####
vpc_cidr = "10.0.0.0/16"

public_subnets_cidr = "10.0.1.0/24"

private_subnets_cidr = "10.0.2.0/24"

#### EC2 variables ####
ec2_name = "Bastion Host"

ec2_security_group_name = "Bastion Host SG"

ec2_security_group_description = "Bastion Host instances SG"

ec2_ami = "ami-00dfe2c7ce89a450b" # Amazon Linux 2 AMI (64-bit x86)  Free Tier eligible

ec2_instance_type = "t2.micro" # Free Tier eligible

ec2_ssh_key_name  = "bastion-host-key"

ec2_ssh_public_key_path = "insert your path"

### EKS ###
cluster_name = "airflow-eks"

#### RDS ####
allocated_storage = ""

db_engine = ""

engine_version = ""

instance_type = ""

database_name = ""

db_username = ""

db_password = ""

#### S3 variables ####
buckebucket_prefix  = "s3-Data-bootcamp-"

acl = "private"

versioning = true

