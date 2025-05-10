variable "vpc_id" {
  description = "The ID of the VPC where security groups will be created"
  type        = string
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
      from_port   = number
      to_port     = number
      ip_protocol = string
      cidr_ipv4   = string
    }))
  }))
}
