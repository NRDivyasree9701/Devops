# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 5.0"
#       ami = "ami-00c257e12d6828491"
#       instance_type="t2.micro"
#       subnet_id=data.aws_subnet.exist_subnet.id
#       vpc_security_group_ids=[aws_security_group.example_sg.id]

#     }
#   }
# }
# provider "aws" {
#   region = "us-west-2"
# }

# data "aws_vpc" "existing_vpc" {
#   filter{
#     name = "tag:Name"
#     values=["MainVPC"]
#   }
# }

# data "aws_subnet" "exist_subnet" {
#   filter{
#     name="tag:Name"
#     values=["first_subnet"]
#   }
#   filter{
#     name = "vpc-id"
#     values=[data.aws_vpc.existing_vpc.id]
#   }
# }

# data "aws_internet_gateway" "exist_igw" {
#   filter{
#     name="attachment.vpc-id"
#     values=[data.aws_vpc.existing_vpc.id]
#   }
# }

# data "aws_route_table" "exist_route" {
#   filter{
#     name="tag:Name"
#     values=["route_table1"]
#   }

#   filter{
#     name = "vpc-id"
#     values=[data.aws_vpc.existing_vpc.id]
#   }
# }

# resource "aws_route_table_association" "route_associated" {
#   subnet_id=data.aws_subnet.exist_subnet.id
#   route_table_id=data.aws_route_table.exist_route.id
# }

# resource "aws_route" "single_route"{
#   route_table_id=data.aws_route_table.exist_route.id
#   destination_cidr_block="0.0.0.0/0"
#   gateway_id=data.aws_internet_gateway.exist_igw.id

# }



# resource "aws_security_group" "example_sg" {
#   name        = "examplesg"
#   description = "Allow inbound traffic on port 22 and 80"
#   vpc_id      = data.aws_vpc.existing_vpc.id


#   #for ssh traffic
#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["44.246.170.18/32"]
#   }
#   #for http traffic
#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   #for https traffic
#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   #for outbound traffic
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]

#   }

#   tags = {
#     Name = "example-sg"
#   }
# }



# create vpc

# create 2 subnet - 1a

# create 2 subnet - 1b



provider "aws" {
   region = "us-west-2"
}

resource "aws_vpc" "vpc_3" {
  cidr_block = "10.0.0.0/16"
  tags={
    Name = "Second_VPC"
  }
}

resource "aws_subnet" "subnet_2"{
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.vpc_3.id
  availability_zone = "us-west-2a"

  tags={
    Name = "Subnet_2"
  }
} 

resource "aws_subnet" "subnet_3"{
  cidr_block = "10.0.2.0/24"
  vpc_id = aws_vpc.vpc_3.id
  availability_zone = "us-west-2b"

  tags={
    Name = "Subnet_3"
  }
}

resource "aws_internet_gateway" "gateway_2" {
  vpc_id = aws_vpc.vpc_3.id  
  tags={
    Name = "Gateway_2"
  }
}

resource "aws_route_table" "route_table3" {
  vpc_id = aws_vpc.vpc_3.id
  tags={
    Name = "Route_Table_3"
  }
}

resource "aws_route" "single_route"{
  route_table_id=aws_route_table.route_table3.id
  destination_cidr_block="0.0.0.0/0"
  gateway_id=aws_internet_gateway.gateway_2.id
}

resource "aws_route_table_association" "route_associated1" {
  subnet_id=aws_subnet.subnet_2.id
  route_table_id=aws_route_table.route_table3.id
}
resource "aws_route_table_association" "route_associated2" {
  subnet_id=aws_subnet.subnet_3.id
  route_table_id=aws_route_table.route_table3.id
}
