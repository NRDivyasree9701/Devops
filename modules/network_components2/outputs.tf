output "vpc_id" {
    value = aws_vpc.main_vpc.id
}

output "subnet_id" {
    value=aws_subnet.main_subnet.id
}

output "internet_gateway_id" {
    value = aws_internet_gateway.main_gateway.id
}