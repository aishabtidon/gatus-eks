output "cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.this.name
}

output "cluster_endpoint" {
  description = "Kubernetes API server endpoint"
  value       = aws_eks_cluster.this.endpoint
}

output "cluster_certificate_authority_data" {
  description = "Base64-encoded CA certificate for kubectl"
  value       = aws_eks_cluster.this.certificate_authority[0].data
}

output "eks_cluster_security_group_id" {
  description = "Security group created by EKS for the control plane"
  value       = aws_eks_cluster.this.vpc_config[0].cluster_security_group_id
}

output "node_group_name" {
  description = "Managed node group name"
  value       = aws_eks_node_group.this.node_group_name
}

output "oidc_provider_arn" {
  description = "IAM OIDC provider ARN (IRSA)"
  value       = aws_iam_openid_connect_provider.oidc.arn
}

output "external_dns_role_arn" {
  description = "IAM role ARN for external-dns"
  value       = aws_iam_role.external_dns.arn
}

output "cert_manager_role_arn" {
  description = "IAM role ARN for cert-manager"
  value       = aws_iam_role.cert_manager.arn
}
