output "elastic_ip" {
  value = aws_eip.main_eip.public_ip
}