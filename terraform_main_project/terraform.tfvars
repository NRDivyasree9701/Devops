ami_id                    = "ami-00c257e12d6828491"
instance_type             = "t2.micro"
key_name                  = "ubuntu"
vpc_cidr                  = "10.0.0.0/16"
public_subnet_cidr        = "10.0.1.0/24"
private_subnet_cidr       = "10.0.3.0/24"
public_availability_zone  = "us-west-2a"
private_availability_zone = "us-west-2b"
instance_state="stopped"

#nacl name
# name   = "main_nacl"
environment = "main"


security_groups = {
  "web_sg" = {
    description = "Security group for web servers"
    ingress = [
      { from_port = 80, to_port = 80, ip_protocol = "tcp", cidr_ipv4 = "0.0.0.0/0" },
      { from_port = 443, to_port = 443, ip_protocol = "tcp", cidr_ipv4 = "0.0.0.0/0" },
      { from_port = 22, to_port = 22, ip_protocol = "tcp", cidr_ipv4 = "182.78.42.130/32" }
    ]
    egress = [
      {  cidr_ipv4 = "0.0.0.0/0" }
    ]
  }
}

# nacl_groups = {
#   "nacl_1" = {
#     description = "NACL for public subnets"
#     nacl_rules = [
#       { rule_number = 100, egress = false, protocol = "tcp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 80, to_port = 80 },
#       { rule_number = 101, egress = false, protocol = "tcp", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 443, to_port = 443 },
#       { rule_number = 102, egress = true, protocol = "-1", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 0, to_port = 0 }
#     ]
#   }

#   "nacl_2" = {
#     description = "NACL for private subnets"
#     nacl_rules = [
#       { rule_number = 200, egress = false, protocol = "tcp", rule_action = "allow", cidr_block = "10.0.0.0/16", from_port = 3306, to_port = 3306 },
#       { rule_number = 201, egress = true, protocol = "-1", rule_action = "allow", cidr_block = "0.0.0.0/0", from_port = 0, to_port = 0 }
#     ]
#   }
# }

ingress_rules = {
  http = {
    rule_number    = 100
    protocol       = "tcp"
    rule_action    = "allow"
    cidr_block     = "0.0.0.0/0"
    from_port      = 80
    to_port        = 80
  }

  ssh = {
    rule_number    = 101
    protocol       = "tcp"
    rule_action    = "allow"
    cidr_block     = "182.78.42.130/32"
    from_port      = 22
    to_port        = 22
  }

  deny_all = {
    rule_number    = 102
    protocol       = "-1"
    rule_action    = "deny"
    cidr_block     = "0.0.0.0/0"
    from_port      = 0
    to_port        = 0
  }
}

# Egress Rules
egress_rules = {
  all_traffic = {
    rule_number    = 100
    protocol       = "-1"
    rule_action    = "allow"
    cidr_block     = "0.0.0.0/0"
    from_port      = 0
    to_port        = 0
  }
}



