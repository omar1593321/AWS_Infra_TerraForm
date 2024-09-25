output "public_instance_ids" {
  value = aws_instance.public[*].id  # Adjust this according to your instance resource naming
}

output "private_instance_ids" {
  value = aws_instance.private[*].id  # Adjust this according to your instance resource naming
}
output "public_ips" {
  value = aws_instance.public[*].public_ip
}
output "private_ips" {
  value = aws_instance.private[*].private_ip
}
