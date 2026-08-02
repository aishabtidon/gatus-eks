output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "CIDR block of the VPC"
  value       = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  description = "IDs of public subnets (load balancers)"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs of private subnets (EKS workers)"
  value       = aws_subnet.private[*].id
}

output "nat_gateway_id" {
  description = "NAT gateway ID"
  value       = aws_nat_gateway.main.id
}

output "alb_security_group_id" {
  description = "Security group for the public ALB / ingress"
  value       = aws_security_group.alb.id
}

output "node_security_group_id" {
  description = "Security group for EKS worker nodes"
  value       = aws_security_group.nodes.id
}

output "cluster_security_group_id" {
  description = "Additional security group for the EKS control plane"
  value       = aws_security_group.cluster.id
}
