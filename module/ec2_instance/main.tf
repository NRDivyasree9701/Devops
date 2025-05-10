
resource "aws_instance" "module" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.public_subnet_id
   vpc_security_group_ids      = var.security_group_ids
  associate_public_ip_address = true
  #   lifecycle {
  #   prevent_destroy = true
  # }
  # tags={
  #     Name = "ModuleDemo"
  # }
  tags = merge(
    {
      Name        = "${var.environment}-ec2"
      Environment = var.environment
    },
    var.extra_tags
  )
}


resource "aws_ec2_instance_state" "ec2_state" {
  instance_id = aws_instance.module.id
  state       = var.instance_state
}

