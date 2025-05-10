resource "aws_security_group" "sg" {
  for_each    = var.security_groups
  name        = each.key
  description = each.value.description
  vpc_id      = var.vpc_id

  tags = {
    Name = each.key
  }
}

# Ingress Rules
resource "aws_vpc_security_group_ingress_rule" "ingress" {
  for_each = merge([
    for sg_name, sg in var.security_groups : {
      for idx, ingress_rule in sg.ingress :
      "${sg_name}-${idx}" => {
        security_group_id = aws_security_group.sg[sg_name].id
        from_port         = ingress_rule.from_port
        to_port           = ingress_rule.to_port
        ip_protocol       = ingress_rule.ip_protocol
        cidr_ipv4         = ingress_rule.cidr_ipv4
      }
    } if length(sg.ingress) > 0
  ]...)

  security_group_id = each.value.security_group_id
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  ip_protocol       = each.value.ip_protocol
  cidr_ipv4         = each.value.cidr_ipv4
}

# Egress Rules
resource "aws_vpc_security_group_egress_rule" "egress" {
  for_each = merge([
    for sg_name, sg in var.security_groups : {
      for idx, egress_rule in sg.egress :
      "${sg_name}-${idx}" => {
        security_group_id = aws_security_group.sg[sg_name].id
        ip_protocol       = "-1"
        cidr_ipv4         = egress_rule.cidr_ipv4
      }
    } if length(sg.egress) > 0
  ]...)

  security_group_id = each.value.security_group_id
  # from_port         = each.value.from_port
  # to_port           = each.value.to_port
  ip_protocol       = each.value.ip_protocol
  cidr_ipv4         = each.value.cidr_ipv4
}
