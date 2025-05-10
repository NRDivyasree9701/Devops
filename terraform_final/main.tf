# # provider
# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 4.0"
#     }
#   }
# }

# # Configure the AWS Provider
# provider "aws" {
#   region = "us-west-2"
# }


# # Resource block
# #VPC

# #MAIN CIDR
# #BLOCKTYPE #BLOCKLABELS  #NOF RESOURCE
# resource "aws_vpc" "myvpc" {
#   cidr_block       = "10.0.0.0/16" 
#   instance_tenancy = "default"

#   tags = {
#     Name = "demovpctf"
#   }
# }
# #SUBNETS
# #public-sub
# resource "aws_subnet" "pub_sub" {
#   vpc_id     = aws_vpc.myvpc.id
#   cidr_block = "10.0.1.0/24"
#   availability_zone = "us-west-2a"
#   tags = {
#     Name = "pub-subnet-1"
#   }
# }

# #private-sub
# resource "aws_subnet" "pvt_sub" {
#   vpc_id     = aws_vpc.myvpc.id
#   cidr_block = "10.0.2.0/24"
#   availability_zone = "us-west-2b"


#   tags = {
#     Name = "pvt-subnet-1"
#   }
# }

# #IGW
# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.myvpc.id

#   tags = {
#     Name = "tf-igw"
#   }
# }

# #ROUTE-TABLE
# #pub-rt
# resource "aws_route_table" "pub-rt" {
#   vpc_id = aws_vpc.myvpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }


#   tags = {
#     Name = "pub-rt"
#   }
# }

# #pvt-rt
# resource "aws_route_table" "pvt-rt" {
#   vpc_id = aws_vpc.myvpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_nat_gateway.nat.id
#   }


#   tags = {
#     Name = "pvt-rt"
#   }
# }
# #EIP
# # resource "aws_eip" "eip" {
# #  vpc = true
# # }

# #NAT

# data "aws_eip" "eip" {
#     filter {
#       name = "tag:Name"
#       values = ["demo2"]
#     }
  
# }
# resource "aws_nat_gateway" "nat" {
#   allocation_id = data.aws_eip.eip.id
#   subnet_id     = aws_subnet.pub_sub.id

#   tags = {
#     Name = "NAT"
#   }

# }

# #rt-asc
# #pub-rt-asc
# resource "aws_route_table_association" "pub-rt_asc" {
#   subnet_id      = aws_subnet.pub_sub.id
#   route_table_id = aws_route_table.pub-rt.id
# }
# #pvt-rt-asc
# resource "aws_route_table_association" "pvt-rt_asc" {
#   subnet_id      = aws_subnet.pvt_sub.id
#   route_table_id = aws_route_table.pvt-rt.id
# }

# #SG
# resource "aws_security_group" "pub-sg" {
#   name        = "pub_sg"
#   description = "Allow TLS inbound traffic"
#   vpc_id      = aws_vpc.myvpc.id

#   ingress {
#     description      = "TLS from VPC"
#     from_port        = 443
#     to_port          = 443
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }
#   ingress {
#     description      = "TLS from VPC"
#     from_port        = 22
#     to_port          = 22
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "allow_tls"
#   }
# }

# #pvt-sg
# resource "aws_security_group" "pvt-sg" {
#   name        = "pvt_sg"
#   description = "Allow TLS inbound traffic"
#   vpc_id      = aws_vpc.myvpc.id


#   ingress {
#     description      = "TLS from VPC"
#     from_port        = 3306
#     to_port          = 3306
#     protocol         = "tcp"
#     security_groups = [aws_security_group.pub-sg.id]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     security_groups = [aws_security_group.pub-sg.id]
#   }

#   tags = {
#     Name = "allow_tls"
#   }
# }


module "security_groups" {
  source = "../module/sec_group"

  vpc_id          = var.vpc_id
  security_groups = var.security_groups
}
