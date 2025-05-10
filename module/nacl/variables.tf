variable "vpc_id" {
  type = string
}

variable "nacl_name"{
    type=string
    default="main"
}
variable "environment" {
  type = string
}
variable "ingress_rules" {
  # type = map(object({
  #   rule_number = number
  #   protocol    = string
  #   from_port   = number
  #   to_port     = number
  #   cidr_block  = string
  # }))
   type = any
   default = {}

}
variable "egress_rules" {
    # type = map(object({
    # rule_number = number
    # protocol    = string
    # from_port   = number
    # to_port     = number
    # cidr_block  = string
    # }))
    type = any
   default = {}
  
}

variable "subnet_id" {
  type = string
}