variable "vpc_id" {}
variable "public_subnets" {}
variable "private_subnets" {}
variable "public_instance_ids" {type        = list(string)}
variable "private_instance_ids" { type        = list(string)}
variable "alb_sg" {
  description = "The security group for the Application Load Balancer"
  type        = string
}