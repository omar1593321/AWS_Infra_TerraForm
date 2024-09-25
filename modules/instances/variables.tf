variable "public_subnets" {
  description = "List of public subnet IDs"
}

variable "private_subnets" {
  description = "List of private subnet IDs"
}
variable "public_sg" {
  description = "ID of the public security group"
}

variable "private_sg" {
  description = "ID of the private security group"
}
variable "alb_dns_name" {}
