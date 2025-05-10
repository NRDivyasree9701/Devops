output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = module.ec2_instance.instance_id
}
output "public_ip" {
  description = "The public IP of the EC2 instance"
  value       = module.ec2_instance.public_ip
}
output "vpc_id" {
  description = "The ID of the created VPC"
  value       = module.net_com.vpc_id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = module.net_com.public_subnet_id
}

output "private_subnet_id" {
  description = "The ID of the private subnet"
  value       = module.net_com.private_subnet_id
}

# output "security_group_id" {
#   description = "The ID of the security group"
#   value       = module.sec_group.security_group_id
# }

output "nacl_id" {
  description = "The ID of the NACL"
  value       = module.nacl.nacl_id
}

output "nacl_association_id" {
  value = module.nacl.nacl_association_id
}

output "security_group_ids" {
  description = "List of created security groups and their IDs"
  value       = module.sec_group.security_group_ids
}

output "ingress_rule_ids" {
  description = "List of created ingress rules and their IDs"
  value       = module.sec_group.ingress_rule_ids
}

output "egress_rule_ids" {
  description = "List of created egress rules and their IDs"
  value       = module.sec_group.egress_rule_ids
}

# output "nacl_ids" {
#   value = module.nacl2.nacl_ids
# }

# output "nacl_rule_ids" {
#   value = module.nacl2.nacl_rule_ids
# }

