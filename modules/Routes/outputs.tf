output "route_table_id" {
  value = aws_route_table.route_table.id
}

# output "route" {
#   value = aws_route.route.destination_cidr_block
# }

output "internet_route" {
  value = aws_route.internet_route.destination_cidr_block
}

output "subnet_association"{
  value = aws_route_table_association.subnet_association.subnet_id
}