
module "networking" {
  source = "./modules/networking"

  vpc_cidr             = var.vpc_cidr
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
}


module "eks" {
  source = "./modules/eks"

  region = var.region
  vpc_id = module.networking.vpc_id
  subnet = module.networking.private_subnets_ids

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  instance_type_group1        = var.instance_type_group1
  instance_type_group2        = var.instance_type_group2
  asg_desired_capacity_group1 = var.asg_desired_capacity_group1
  asg_desired_capacity_group2 = var.asg_desired_capacity_group2
}
module "ec2" {
  source = "./modules/ec2"

  region    = var.region
  vpc_id    = module.networking.vpc_id
  subnet_id = module.networking.private_subnets_ids

  ec2_name                       = var.ec2_name
  ec2_security_group_name        = var.ec2_security_group_name
  ec2_security_group_description = var.ec2_security_group_description
  ec2_ami                        = var.ec2_ami
  ec2_instance_type              = var.ec2_instance_type
  ec2_ssh_key_name               = var.ec2_ssh_public_key_path
}

module "rds" {
  source = "./modules/rds"

  region         = var.region
  vpc_id         = module.networking.vpc_id
  private_subnet = module.networking.private_subnets_ids

  allocated_storage   = var.allocated_storage
  db_engine           = var.db_engine
  engine_version      = var.engine_version
  instance_type       = var.instance_type
  database_name       = var.database_name
  db_username         = var.db_username
  db_password         = var.db_password
  service_sg          = var.service_sg
  publicly_accessible = var.publicly_accessible
}

module "s3" {
  source = "./modules/s3"

  buckebucket_prefix = var.buckebucket_prefix
  acl                = var.acl
  versioning         = var.versioning
}
