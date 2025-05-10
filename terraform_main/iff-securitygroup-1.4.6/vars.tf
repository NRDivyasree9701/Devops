
variable "name" {
  type        = string
  description = "Prefix for the security group names"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
}

variable "description" {
  type        = string
  description = "description of sg"
  default     = ""
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "Tags for the security groups"
}

variable "revoke_rules_on_delete" {
  type        = bool
  default     = null
  description = "Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself. This is normally not needed, however certain AWS services such as Elastic Map Reduce may automatically add required rules to security groups used with the service, and those rules may contain a cyclic dependency that prevent the security groups from being destroyed without removing the dependency first."
}


variable "sg_ingress" {
  type = list(object({
    from_port       = number
    to_port         = number
    protocol        = string
    description     = optional(string)
    cidr_blocks     = optional(list(string))
    security_groups = optional(list(string))
    prefix_list_ids = optional(list(string))
  }))
  default     = null
  description = "Ingress rules for the security group"
}

variable "sg_egress" {
  type = list(object({
    from_port       = number
    to_port         = number
    protocol        = string
    description     = optional(string)
    cidr_blocks     = optional(list(string))
    security_groups = optional(list(string))
    prefix_list_ids = optional(list(string))
  }))
  default     = null
  description = "Egress rules for the security group"
}

variable "additional_sg_rule" {
  type = map(object({
    type            = string
    from_port       = number
    to_port         = number
    protocol        = string
    description     = optional(string)
    cidr_blocks     = optional(list(string))
    security_group  = optional(string)
    prefix_list_ids = optional(list(string))
  }))
  default = null
}
