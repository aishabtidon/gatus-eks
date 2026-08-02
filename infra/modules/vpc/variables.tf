variable "project_name" {
  description = "Project name for resource naming"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "cluster_name" {
  description = "EKS cluster name (used for kubernetes subnet discovery tags)"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "allowed_cidr_ipv4" {
  description = "CIDR allowed to reach the ALB (80/443) and cluster API"
  type        = string
}

variable "gatus_container_port" {
  description = "Container port Gatus listens on (ALB -> nodes)"
  type        = number
  default     = 8080
}
