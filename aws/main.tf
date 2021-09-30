module "networking" {
  source                 = "./modules/networking"
  vpc_cidr               = var.vpc_cidr
  public_subnets_cidr    = var.public_subnets_cidr
  private_subnets_cidr   = var.private_subnets_cidr
  availability_zones     = var.availability_zones
  destination_cidr_block = var.destination_cidr_block
}
