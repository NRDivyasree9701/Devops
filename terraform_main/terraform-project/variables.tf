# variable "ami_id" {
#   description = "AMI ID for the EC2 instance"
#   type        = string
# }

# variable "instance_type" {
#   description = "Instance type for the EC2 instance"
#   type        = string
# }

# # variable "ec2secgroup" {
# #   description = "List of security group IDs"
# #   type        = list(string)
# # }

# variable "key_name" {
#   description = "SSH key name for accessing the EC2 instance"
#   type        = string
# }

# variable "subnet_id" {
#   description = "Subnet ID where the EC2 instance will be launched"
#   type        = string
# }

# variable "environment" {
#   description = "Deployment environment (dev, prod, stage)"
#   type        = string
# }

variable "vpc_id"{
  type = string
}
variable "environment"{
  type=string
}