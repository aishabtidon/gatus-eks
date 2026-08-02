output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs (load balancers)"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs (EKS workers)"
  value       = module.vpc.private_subnet_ids
}

output "cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "EKS API server endpoint"
  value       = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  description = "Base64-encoded cluster CA (for kubeconfig)"
  value       = module.eks.cluster_certificate_authority_data
  sensitive   = true
}

output "alb_security_group_id" {
  description = "Security group for the public ALB / ingress"
  value       = module.vpc.alb_security_group_id
}

output "node_security_group_id" {
  description = "Security group attached to worker nodes"
  value       = module.vpc.node_security_group_id
}

output "cluster_security_group_id" {
  description = "Additional security group for the EKS control plane"
  value       = module.vpc.cluster_security_group_id
}

output "oidc_provider_arn" {
  description = "IAM OIDC provider ARN (IRSA)"
  value       = module.eks.oidc_provider_arn
}

output "external_dns_role_arn" {
  description = "IAM role ARN for external-dns"
  value       = module.eks.external_dns_role_arn
}

output "cert_manager_role_arn" {
  description = "IAM role ARN for cert-manager"
  value       = module.eks.cert_manager_role_arn
}
