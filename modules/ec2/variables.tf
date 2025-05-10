variable "ami_id" {
    type=string
}

variable "key_name" {
    type = string
}

variable "instance_type"{
    type = string
}
variable "region" {
    type = string
}

variable "subnet_id" {
    type = string
}
variable "ec2secgroup" {
  type = string
}

variable "instance_state" {
    type = string
    default="running"
}