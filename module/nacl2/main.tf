resource "aws_network_acl" "nacl" {
  for_each = var.nacl_groups
  vpc_id   = var.vpc_id
  tags = {
    Name        = each.key
    Description = each.value.description #  Store description in tags
  }
}

resource "aws_network_acl_rule" "nacl_rule" {
  for_each = merge([
    for nacl_name, rules in var.nacl_groups : {
      for idx, rule in rules.nacl_rules :
      "${nacl_name}_${idx}" => {
        network_acl_id = aws_network_acl.nacl[nacl_name].id
        rule_number    = rule.rule_number
        egress         = rule.egress
        protocol       = rule.protocol
        rule_action    = rule.rule_action
        cidr_block     = rule.cidr_block
        from_port      = rule.from_port
        to_port        = rule.to_port
      }
    } if length(rules.nacl_rules) > 0
  ]...)

  network_acl_id = each.value.network_acl_id
  rule_number    = each.value.rule_number
  egress         = each.value.egress
  protocol       = each.value.protocol
  rule_action    = each.value.rule_action
  cidr_block     = each.value.cidr_block
  from_port      = each.value.from_port
  to_port        = each.value.to_port
}

