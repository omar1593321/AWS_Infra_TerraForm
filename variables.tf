# VPC Configuration
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

# Subnets
variable "public_subnet_cidrs" {
  description = "Public subnet CIDRs"
  default     = ["10.0.0.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDRs"
  default     = ["10.0.1.0/24", "10.0.3.0/24"]
}

# Availability Zones
variable "azs" {
  description = "Availability zones"
  default     = ["us-east-1a", "us-east-1b"]
}

# State Management (S3 and DynamoDB)
variable "state_bucket_name" {
  description = "The name of the S3 bucket for state management"
  default     = "my-terraform-state-bucket"
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table for state locking"
  default     = "terraform-state-lock"
}
