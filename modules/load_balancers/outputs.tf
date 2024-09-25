output "nlb_dns_name" {
  value = aws_lb.network_load_balancer.dns_name  # Adjust the resource name accordingly
}

output "alb_dns_name" {
  value = aws_lb.application_load_balancer.dns_name  # Adjust the resource name accordingly
}
