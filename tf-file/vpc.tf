# VPC
resource "aws_vpc" "myvpc" {
  cidr_block       = var.cidr_vpc
  instance_tenancy = "default"

  tags = {
    Name        = "ANI-demo-vpc"
    Project     = "ANI"
    Environment = "dev"
  }
}

# Internet Gateway (IGW)
resource "aws_internet_gateway" "tigw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name        = "ANI-IGW"
    Project     = "ANI"
    Environment = "dev"
  }
}

# Public Subnet - 1
resource "aws_subnet" "pubsub1" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.subpub1
  availability_zone = var.az_sub_pub1

  tags = {
    Name        = "pub-sub-1"
    Project     = "ANI"
    Environment = "dev"
  }
}

# Private Subnet - 1
# resource "aws_subnet" "pvtsub1" {
#   vpc_id            = aws_vpc.myvpc.id
#   cidr_block        = var.subpvt1
#   availability_zone = var.az_sub_pvt1

#   tags = {
#     Name        = "pvt-sub-1"
#     Project     = "ANI"
#     Environment = "dev"
#   }
# }

# Route Table - Public
resource "aws_route_table" "pubrt1" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tigw.id
  }

  tags = {
    Name        = "RT-PUBRT-1"
    Project     = "ANI"
    Environment = "dev"
  }
}

# Route Table - Private
# resource "aws_route_table" "pvtrt1" {
#   vpc_id = aws_vpc.myvpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_nat_gateway.pvtnat1.id
#   }

#   tags = {
#     Name        = "RT-PVTRT-1"
#     Project     = "ANI"
#     Environment = "dev"
#   }
# }

# Elastic IP for NAT Gateway
# resource "aws_eip" "eip1" {
#  # vpc = true
#  domain = "vpc" 

#   tags = {
#     Name        = "EIP-ANI"
#     Project     = "ANI"
#     Environment = "dev"
#   }
# }

# # NAT Gateway
# resource "aws_nat_gateway" "pvtnat1" {
#   allocation_id = aws_eip.eip1.id
#   subnet_id     = aws_subnet.pubsub1.id

#   tags = {
#     Name        = "T-NAT1"
#     Project     = "ANI"
#     Environment = "dev"
#   }
# }

#Route Table Association - Public Subnet
resource "aws_route_table_association" "pubasc1" {
  subnet_id      = aws_subnet.pubsub1.id
  route_table_id = aws_route_table.pubrt1.id
}

# Route Table Association - Private Subnet
# resource "aws_route_table_association" "pvtasc1" {
#   subnet_id      = aws_subnet.pvtsub1.id
#   route_table_id = aws_route_table.pvtrt1.id
# }

# Security Group - Public
resource "aws_security_group" "pub-seg" {
  name        = "pub-seg"
  description = "Allow public inbound traffic"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    description  = "Allow HTTP"
    from_port    = 80
    to_port      = 80
    protocol     = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }
  ingress {
    description  = "Allow SSH"
    from_port    = 22
    to_port      = 22
    protocol     = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  egress {
    from_port    = 0
    to_port      = 0
    protocol     = "-1"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "pub-seg"
    Project     = "ANI"
    Environment = "dev"
  }
}

# Security Group - Private
# resource "aws_security_group" "pvt-seg" {
#   name        = "pvt-seg"
#   description= "Allow internal inbound traffic"
#   vpc_id      = aws_vpc.myvpc.id

#   ingress {
#     description     = "Allow HTTP from Public SG"
#     from_port       = 80
#     to_port         = 80
#     protocol        = "tcp"
#     security_groups = [aws_security_group.pub-seg.id]
#   }
#   ingress {
#     description     = "Allow SSH from Public SG"
#     from_port       = 22
#     to_port         = 22
#     protocol        = "tcp"
#     security_groups = [aws_security_group.pub-seg.id]
#   }
#   ingress {
#     description     = "Allow MySQL from Public SG"
#     from_port       = 3306
#     to_port         = 3306
#     protocol        = "tcp"
#     security_groups = [aws_security_group.pub-seg.id]
#   }

#   egress {
#     from_port       = 0
#     to_port         = 0
#     protocol        = "-1"
#     security_groups = [aws_security_group.pub-seg.id]
#   }

#   tags = {
#     Name        = "pvt-seg"
#     Project     = "ANI"
#     Environment = "dev"
#   }
# }