variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS control plane"
  type        = string
  default     = "1.31"
}

variable "vpc_id" {
  description = "VPC ID from the VPC module"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs (worker nodes)"
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "Public subnet IDs (load balancers / ingress)"
  type        = list(string)
}

variable "cluster_security_group_id" {
  description = "Additional security group for the EKS control plane (from VPC module)"
  type        = string
}

variable "node_security_group_id" {
  description = "Security group for worker nodes (from VPC module)"
  type        = string
}

variable "cluster_endpoint_public_access" {
  description = "Allow kubectl/API access from the public internet"
  type        = bool
  default     = true
}

variable "cluster_endpoint_private_access" {
  description = "Allow kubectl/API access from inside the VPC"
  type        = bool
  default     = true
}

variable "node_instance_types" {
  description = "EC2 instance types for the managed node group"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "node_min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "node_max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 3
}

variable "cluster_enabled_log_types" {
  description = "EKS control plane log types to send to CloudWatch. Empty = disabled (cheapest). Options: api, audit, authenticator, controllerManager, scheduler"
  type        = list(string)
  default     = []
}

variable "cloudwatch_log_retention_days" {
  description = "Retention for EKS control plane CloudWatch logs (only used when logging is enabled)"
  type        = number
  default     = 7
}
