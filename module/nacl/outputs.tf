output "nacl_id" {
  description = "The ID of the created Network ACL"
  value       = aws_network_acl.nacl.id
}
output "nacl_ingress_rules" {
    description = "The ingress rules of the created Network ACL"
    value={for k , v in var.ingress_rules : k =>{
        rule_number=v.rule_number
        protocol  = v.protocol
        from_port = v.from_port
        to_port   = v.to_port
        cidr_block = v.cidr_block
    }}
}

output "nacl_egress_rules" {
    description = "The egress rules of the created Network ACL"
    value={for k , v in var.egress_rules : k =>{
        rule_number=v.rule_number
        protocol  = v.protocol
        from_port = v.from_port
        to_port   = v.to_port
        cidr_block = v.cidr_block
    }}
}
output "ncl_arn" {
    value = aws_network_acl.nacl.arn
}

output "nacl_association_id" {
  description = "ID of the NACL Association"
  value       = aws_network_acl_association.nacl_assoc.id
}