output "instance_id" {
  value=aws_instance.module.id
}
output "public_ip" {
  value = aws_instance.module.public_ip
}