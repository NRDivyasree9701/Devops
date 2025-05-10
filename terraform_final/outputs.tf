output "security_group_ids" {
  description = "List of created security groups and their IDs"
  value       = module.security_groups.security_group_ids
}

output "ingress_rule_ids" {
  description = "List of created ingress rules and their IDs"
  value       = module.security_groups.ingress_rule_ids
}

output "egress_rule_ids" {
  description = "List of created egress rules and their IDs"
  value       = module.security_groups.egress_rule_ids
}
