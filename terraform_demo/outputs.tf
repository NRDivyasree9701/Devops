output "vpc_id" {
    value       = module.vpc.vpc_id
}
output "subnet_id" {
    value       = module.vpc.subnet_id
}
output "ec2secgroup" {
    value       = module.securitygroup.ec2secgroup
}
output "instance_id" {
    value = module.ec2.instance_id
}
# output "public_ip" {
#     value = module.ec2.public_ip
# }
output "route_table_id" {
    value = module.Routes.route_table_id
}

output "elastic_ip"{
    value = module.eip.elastic_ip
}
# output "elastic_ip" {
#     value = aws_eip.existing_eip.public_ip
# }