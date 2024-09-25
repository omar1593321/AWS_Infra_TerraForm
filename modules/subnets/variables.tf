variable "vpc_id" {
  description = "VPC ID to associate the subnets"
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDRs"
  default     = ["10.0.0.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDRs"
  default     = ["10.0.1.0/24", "10.0.3.0/24"]
}

variable "azs" {
  description = "Availability zones"
  default     = ["us-east-1a", "us-east-1b"]
}
variable "igw_id" {
  description = "Internet Gateway ID to associate with the route table"
}


variable "nat_gateway_id" {
  description = "NAT Gateway ID"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of Private Subnet IDs"
  type        = list(string)
}
variable "public_subnet_ids" {
  description = "List of Public Subnet IDs for NAT Gateways"
  type        = list(string)
}