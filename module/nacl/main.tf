resource "aws_network_acl" "nacl" {
  vpc_id = var.vpc_id

  tags = {
    Name        = "${var.environment}"
    Environment = var.environment
  }
}

# Ingress (Inbound) NACL Rules
resource "aws_network_acl_rule" "ingress_rules" {
  for_each = var.ingress_rules

  network_acl_id = aws_network_acl.nacl.id
  rule_number    = each.value.rule_number
  egress         = false
  protocol       = each.value.protocol
  rule_action    = each.value.rule_action
  cidr_block     = each.value.cidr_block
  from_port      = each.value.from_port
  to_port        = each.value.to_port
}

# Egress (Outbound) NACL Rules
resource "aws_network_acl_rule" "egress_rules" {
  for_each = var.egress_rules

  network_acl_id = aws_network_acl.nacl.id
  rule_number    = each.value.rule_number
  egress         = true
  protocol       = each.value.protocol
  rule_action    = each.value.rule_action
  cidr_block     = each.value.cidr_block
  from_port      = each.value.from_port
  to_port        = each.value.to_port
}

resource "aws_network_acl_association" "nacl_assoc" {
  network_acl_id = aws_network_acl.nacl.id
  subnet_id=var.subnet_id
}
