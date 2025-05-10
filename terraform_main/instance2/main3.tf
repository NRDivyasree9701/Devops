provider "aws" {
  region = "us-west-2"

}

data "aws_subnet" "ex_subnet" {
  filter {
    name="tag:Name"
    values=["default-subnet"]
  }
}

data "aws_vpc" "ex_vpc" {
  filter {
    name="tag:Name"
    values=["default-vpc"]
  }
}

resource "aws_instance" "instance3"{
    ami           = "ami-00c257e12d6828491"
  instance_type = "t2.micro"
   #availability_zone="us-west-2b"
  key_name      = "ubuntu"
  subnet_id = data.aws_subnet.ex_subnet.id
  security_groups = [aws_security_group.sec_group2.id]

  tags={
    Name="instance3"
  }
}

resource "aws_security_group" "sec_group2" {
  name        = "sec_group2"
  #description = "Allow inbound traffic on port 22 and 80"
  vpc_id      = data.aws_vpc.ex_vpc.id
  


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

# resource "aws_ebs_volume" "custom_volume" {
#   availability_zone = "us-west-2b"
#   size               = 8
#   type = "gp3"
#   iops = 3000
#   throughput = 125

#   tags={
#     Name = "myVolume"
#   }
  
# }
# resource "aws_volume_attachment" "attach_volume" {
#   device_name = "/dev/sdf"
#   volume_id   = aws_ebs_volume.custom_volume.id
#   instance_id = aws_instance.instance3.id
# }

module "Existing_eip" {
  source = "../modules/Existing_eip"
  instance_id = aws_instance.instance3.id
}
