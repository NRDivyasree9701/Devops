provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "instance3" {
  ami             = "ami-00c257e12d6828491"
  instance_type   = "t2.micro"
  key_name        = "ubuntu"
  subnet_id       = aws_subnet.new_subnet.id
  security_groups = [aws_security_group.sec_group3.id]
  associate_public_ip_address = true


  tags = {
    Name = "instance4"
  }
}

resource "aws_vpc" "new_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "new_vpc"
  }
}

resource "aws_subnet" "new_subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.new_vpc.id
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "new_subnet"
  }
}

resource "aws_internet_gateway" "new_gateway" {
  vpc_id = aws_vpc.new_vpc.id
  tags = {
    Name = "new_gateway"
  }
}

resource "aws_route_table" "new_route_table" {
  vpc_id = aws_vpc.new_vpc.id
  tags = {
    Name = "new_route_table"
  }
}

resource "aws_route_table_association" "new_assoc" {
  subnet_id      = aws_subnet.new_subnet.id
  route_table_id = aws_route_table.new_route_table.id
}

resource "aws_route" "new_route" {
  route_table_id         = aws_route_table.new_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.new_gateway.id

}

resource "aws_security_group" "sec_group3" {
  name = "sec_group3"
  #description = "Allow inbound traffic on port 22 and 80"
  vpc_id = aws_vpc.new_vpc.id



  #for ssh traffic
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["49.207.180.197/32"]
  }
  #for http traffic
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  #for https traffic
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #for outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "example-sg"
  }
}
