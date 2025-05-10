
resource "aws_instance" "module" {
    ami=var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [var.ec2secgroup]
    key_name = var.key_name
    subnet_id = var.subnet_id

#     lifecycle {
#     prevent_destroy = true
#   }
    tags={
        Name = "ModuleDemo"
    }
}

resource "aws_ec2_instance_state" "ec2_state"{
    instance_id = aws_instance.module.id
    state=var.instance_state
}

