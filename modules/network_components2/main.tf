resource "aws_vpc" "main_vpc"{
    cidr_block = var.vpc_cidr
    tags = {
      Name = "MainVPC"
    }
}

resource "aws_subnet" "main_subnet" {
    cidr_block = var.subnet_cidr
    vpc_id=aws_vpc.main_vpc.id
    availability_zone = var.availability_zone
    tags={
        Name = "MainSubnet"
    }
}

resource "aws_internet_gateway" "main_gateway"{
    vpc_id = aws_vpc.main_vpc.id
    tags={
        Name = "MainGateway"
    }
}

