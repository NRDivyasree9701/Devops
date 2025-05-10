variable aws_region {
  type        = string
  description = "region"
  default     = "us-west-2"
}
#CIDR
variable cidr_vpc {
  type        = string
  description = "cidr"
  default     = "10.0.0.0/16" #65536
}
#pubsub-1
variable subpub1 {
  type        = string
  description = "cidr"
  default     = "10.0.1.0/24" #256
}


#pvtsub-1
variable subpvt1 {
  type        = string
  description = "cidr"
  default     = "10.0.2.0/24" #256
}



#az-pub-1
variable az_sub_pub1 {
  type        = string
  description = "cidr"
  default     = "us-west-2a" 
}


#az-pvt-1
variable az_sub_pvt1 {
  type        = string
  description = "cidr"
  default     = "us-west-2b" 
}

#AMI
variable ami_id {
  type        = string
  description = "cidr"
  default     = "ami-084568db4383264d4" 
}

#Instance Type
variable instance_type {
  type        = string
  description = "cidr"
  default     = "t2.micro" 
}

# AWS Access Key
# variable "aws_access_key" {
#   type        = string
#   description = "AWS Access Key for authentication"
#   sensitive   = true
# }


# # AWS Secret Key
# variable "aws_secret_key" {
#   type        = string
#   description = "AWS Secret Key for authentication"
#   sensitive   = true

# }


variable "instance_state" {
  type=string
  default = "running"
}