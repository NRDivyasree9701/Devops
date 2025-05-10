ami_id              = "ami-00c257e12d6828491"
instance_type       = "t2.micro"
key_name            = "ubuntu"
vpc_cidr            = "10.0.0.0/16"
public_subnet_cidr  = "10.0.1.0/24"
private_subnet_cidr = "10.0.3.0/24"

nacl_name = "nacl"
environment="dev"

ingress_rules = {
  "rule1" = {
    rule_number = 100
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_block  = "0.0.0.0/0"
  }
  "rule2" = {
    rule_number = 101
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_block  = "0.0.0.0/0"
  }
}

egress_rules = {
  "rule1" = {
    rule_number = 100
    protocol    = "tcp"
    from_port   = 0
    to_port     = 0
    cidr_block  = "0.0.0.0/0"
  }
}
# ingress_rules = {
#   ssh   = { rule_number = 100, from_port = 22, to_port = 22, protocol = "tcp", cidr_block = "182.78.42.130/32" }
#   http  = { rule_number = 110, from_port = 80, to_port = 80, protocol = "tcp", cidr_block = "0.0.0.0/0" }
#   https = { rule_number = 120, from_port = 443, to_port = 443, protocol = "tcp", cidr_block = "0.0.0.0/0" }
# }

# egress_rules = {
#   all_outbound = { rule_number = 200, from_port = 0, to_port = 0, protocol = "-1", cidr_block = "0.0.0.0/0" }
# }
