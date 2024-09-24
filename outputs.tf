# VPC Outputs
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

# Subnet Outputs
output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = module.subnets.public_subnet_ids
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = module.subnets.private_subnet_ids
}

# Instance Outputs
output "public_instance_ids" {
  description = "The IDs of the public instances"
  value       = module.instances.public_instance_ids
}

output "private_instance_ids" {
  description = "The IDs of the private instances"
  value       = module.instances.private_instance_ids
}

# Load Balancer Outputs
output "nlb_dns_name" {
  description = "The DNS name of the Network Load Balancer"
  value       = module.load_balancers.nlb_dns_name
}

output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = module.load_balancers.alb_dns_name
}
output "igw_id" {
  value = module.vpc.igw_id
}
output "public_ips" {
  value = module.instances.public_ips
}

output "private_ips" {
  value = module.instances.private_ips
}
