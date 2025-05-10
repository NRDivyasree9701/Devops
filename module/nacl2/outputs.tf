output "nacl_ids" {
  description = "List of Network ACL IDs"
  value       = { for k, nacl in aws_network_acl.nacl : k => nacl.id }
}

output "nacl_rule_ids" {
  description = "List of Network ACL Rule IDs"
  value       = { for k, rule in aws_network_acl_rule.nacl_rule : k => rule.id }
}

