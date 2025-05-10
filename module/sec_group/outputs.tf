output "security_group_ids" {
  description = "List of created security groups and their IDs"
  value       = { for sg_name, sg in aws_security_group.sg : sg_name => sg.id }
}

output "ingress_rule_ids" {
  description = "List of created ingress rules and their IDs"
  value       = { for key, rule in aws_vpc_security_group_ingress_rule.ingress : key => rule.id }
}

output "egress_rule_ids" {
  description = "List of created egress rules and their IDs"
  value       = { for key, rule in aws_vpc_security_group_egress_rule.egress : key => rule.id }
}



