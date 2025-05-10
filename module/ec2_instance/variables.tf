variable "ami_id" {
  type = string
}

variable "key_name" {
  type = string
}

variable "instance_type" {
  type = string
}
# variable "region" {
#     type = string
# }

variable "environment" {
  description = "The environment (dev, qa, prod)"
  type        = string
}


variable "public_subnet_id" {
  type = string
}
# variable "ec2secgroup" {
#   type = string
# }

variable "instance_state" {
  type    = string
  default = "running"
}
variable "extra_tags" {
  description = "Additional tags to apply to the instance"
  type        = map(string)
  default     = {}
}

variable "security_group_ids" {
  description = "List of Security Group IDs from SG module"
  type        = list(string)
}