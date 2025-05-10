resource "aws_security_group" "ec2secgroup" {
    vpc_id = var.vpc_id
  #   ingress {
  #   from_port   = 22
  #   to_port     = 22
  #   protocol    = "tcp"
  #   cidr_blocks = ["49.207.180.197/32"]
  # }

  # ingress {
  #   from_port   = 80
  #   to_port     = 80
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  #  egress {
  #   from_port   = 0
  #   to_port     = 0
  #   protocol    = "-1"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }
  tags = {
    Name = "ec2secgroup"
  }

#   dynamic "ingress"{
#   for_each = var.ingress_port
#   content {
#     from_port   = ingress.value
#     to_port     = ingress.value
#     protocol    = "tcp"
#     cidr_blocks = lookup(var.cidr_block,ingress.value,["0.0.0.0/0"])
#   }

# }

# dynamic "egress"{
#   for_each = var.egress_port
#   content {
#     from_port   = egress.value
#     to_port     = egress.value
#     protocol    = "-1"
#     cidr_blocks = lookup(var.cidr_block,egress.value,["0.0.0.0/0"])
#   }
# }

 dynamic "ingress"{
  for_each = [for rule in var.cidr_block: rule if rule.port!=0]
  content {
    from_port   = ingress.value.port
    to_port     = ingress.value.port
    protocol    = "tcp"
    cidr_blocks = ingress.value.cidr_block
  }

}

dynamic "egress"{
  for_each = [for rule in var.cidr_block : rule if rule.port == 0]
  content {
    from_port   = egress.value.port
    to_port     = egress.value.port
    protocol    = "-1"
    cidr_blocks = egress.value.cidr_block
  }
}
}

