variable "public_availability_zone" {
  type    = string
  default = "us-west-2a"
}
variable "private_availability_zone" {
  type    = string
  default = "us-west-2b"
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

variable "environment" {
  type = string
}