module "networking" {
  source                 = "./modules/networking"
  vpc_cidr               = var.vpc_cidr
  public_subnets_cidr    = var.public_subnets_cidr
  private_subnets_cidr   = var.private_subnets_cidr
  availability_zones     = var.availability_zones
  destination_cidr_block = var.destination_cidr_block
}

module "ec2" {
  source = "./modules/ec2"
  subnet_id = module.networking.private_subnets_ids
  vpc_id = module.networking.vpc_id
  instance_count = var.instance_count
  ec2_name = var.ec2_name 
  ec2_security_group_name = var.ec2_security_group_name
  ec2_security_group_description = var.ec2_security_group_description
  ec2_ami = var.ec2_ami
  ec2_instance_type = var.ec2_instance_type
  ec2_ssh_key_name = var.ec2_ssh_public_key_path
}