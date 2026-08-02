module "vpc" {
  source = "./modules/vpc"

  project_name         = var.project_name
  environment          = var.environment
  cluster_name         = var.cluster_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  allowed_cidr_ipv4    = var.allowed_cidr_ipv4
  gatus_container_port = var.gatus_container_port
}

module "eks" {
  source = "./modules/eks"

  cluster_name       = var.cluster_name
  cluster_version    = var.cluster_version
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  public_subnet_ids  = module.vpc.public_subnet_ids

  cluster_security_group_id = module.vpc.cluster_security_group_id
  node_security_group_id    = module.vpc.node_security_group_id

  node_instance_types = var.node_instance_types
  node_desired_size   = var.node_desired_size
  node_min_size       = var.node_min_size
  node_max_size       = var.node_max_size

  # Default [] = no CloudWatch control-plane logs (avoids high CW Logs bill)
  cluster_enabled_log_types = var.cluster_enabled_log_types
}
