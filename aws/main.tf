
module "networking" {
  source                 = "./modules/networking"
  vpc_cidr               = var.vpc_cidr
  public_subnets_cidr    = var.public_subnets_cidr
  private_subnets_cidr   = var.private_subnets_cidr
  availability_zones     = var.availability_zones
  destination_cidr_block = var.destination_cidr_block
}

module "eks" {
  source = "./modules/eks"
  
  region          = var.region
  cluster_name    = var.cluster_name
  cluster_version = "1.20"
  vpc_id          = module.networking.vpc_id
  subnets         = module.networking.private_subnets_ids

  instance_type_group1        = "t2.small"
  instance_type_group2        = "t2.medium"
  asg_desired_capacity_group1 = 2
  asg_desired_capacity_group2 = 1

  
}
