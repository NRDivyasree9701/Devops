variable "vpc_id" {
  type = string
}

# variable "name"{
#     type=string
#     default="main"
# }
# variable "environment" {
#   type = string
# }

variable "nacl_groups" {
  description = "a map of nacl with dynamic ingress and egress rules"
  type = map(object({
    description = string
    nacl_rules = list(object({
      rule_number = number
      egress      = bool
      protocol    = string
      rule_action = string
      cidr_block  = string
      from_port   = number
      to_port     = number
    }))
  }))
}

