output "instance_id" {
  value = aws_instance.module.id
}
output "public_ip" {
  value = aws_instance.module.public_ip
}
output "private_ip" {
  description = "Private IP of the instance"
  value       = aws_instance.module.private_ip
}