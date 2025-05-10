variable "instance_type" {
  type = string
}
variable "ami_id" {
  type = string
}
variable "instance_state"{
  type = string
}

variable "environment" {
  type = string
}

variable "key_name" {
  type = string
}
variable "vpc_cidr" {
  type = string
}
variable "public_subnet_cidr" {
  type = string
}
variable "private_subnet_cidr" {
  type = string
}
variable "public_availability_zone" {
  type = string
}
variable "private_availability_zone" {
  type = string
}
variable "ingress_rules" {
  type    = any
  default = {}
}
variable "egress_rules" {
  type    = any
  default = {}
}

variable "name" {
  type    = string
  default = "main_ncl"
}

variable "security_groups" {
  description = "A map of security groups with their ingress and egress rules"
  type = map(object({
    description = string
    ingress = list(object({
      from_port   = number
      to_port     = number
      ip_protocol = string
      cidr_ipv4   = string
    }))
    egress = list(object({
      # from_port   = number
      # to_port     = number
      # ip_protocol = string
      cidr_ipv4   = string
    }))
  }))
}

# variable "nacl_groups" {
#   description = "a map of nacl with dynamic ingress and egress rules"
#   type = map(object({
#     description = string
#     nacl_rules = list(object({
#       rule_number = number
#       egress      = bool
#       protocol    = string
#       rule_action = string
#       cidr_block  = string
#       from_port   = number
#       to_port     = number
#     }))
#   }))
# }


# variable "security_group_ids" {
  
# }