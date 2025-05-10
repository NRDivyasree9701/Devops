# module "ec2_instance" {
#     source="../module/ec2_instance"
#     ami_id=var.ami_id
#     instance_type = var.instance_type
#     subnet_id = var.subnet_id
#     key_name = var.key_name
#     environment = var.environment
# }

module "ec2secgroup" {
    source = "../module/sec_group"
    vpc_id = var.vpc_id
    environment = var.environment
  
}