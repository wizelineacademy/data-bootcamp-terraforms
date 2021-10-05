module "vpc" {
  source = "./modules/vpc"

  project_id  = var.project_id
  
}

module "gke" {
  source = "./modules/gke"

  project_id    = var.project_id
  cluster_name  = "airflow-gke-data-bootcamp"
  region        = var.region
  vpc_id        = module.vpc.vpc
  subnet_id     = module.vpc.private_subnets[0]
  
}