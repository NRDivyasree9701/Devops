resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name        = "MyVPC"
    Environment = "${var.environment}"
  }
}

resource "aws_subnet" "public_subnet" {
  cidr_block              = var.public_subnet_cidr
  vpc_id                  = aws_vpc.main.id
  availability_zone       = var.public_availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name        = "PublicSubnet"
    Environment = "${var.environment}"
  }
}

resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "internet-gateway"
  }
}
# Public Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "public-route-table"
  }
}
#public route
resource "aws_route" "public_internet" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main_igw.id # Internet access
}

# Associate Public Subnet with Public Route Table
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}
#private subnet
resource "aws_subnet" "private_subnet" {
  cidr_block        = var.private_subnet_cidr
  vpc_id            = aws_vpc.main.id
  availability_zone = var.private_availability_zone
  tags = {
    Name        = "PrivateSubnet"
    Environment = "${var.environment}"
  }
}
# Private Route Table (No direct internet access)
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "private-route-table"
  }
}

# Private Route to NAT Gateway
resource "aws_route" "private_nat" {
  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gw.id # Route through NAT Gateway
}


# Associate Private Subnet with Private Route Table
resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}

data "aws_eip" "existing_eip" {
  filter {
    name   = "tag:Name"
    values = ["demo"] # Ensure your EIP is tagged with this name
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id     = data.aws_eip.existing_eip.id
  subnet_id         = aws_subnet.public_subnet.id
  connectivity_type = "public"
  tags = {
    Name = "nat-gateway"
  }
  depends_on = [aws_internet_gateway.main_igw]
}




