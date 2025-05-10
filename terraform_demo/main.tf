module "vpc" {
  source="../modules/network_components2"
  vpc_cidr = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
  availability_zone = var.availability_zone
#    route_table_id =module.Routes.route_table_id
  # internet_gateway_id=module.vpc.internet_gateway_id
  # ami_id = var.ami_id
}
module "securitygroup"{
    source="../modules/securitygroup"
    vpc_id = module.vpc.vpc_id
}

module "ec2" {
    source = "../modules/ec2"
    ami_id = var.ami_id
    instance_type = var.instance_type
    subnet_id = module.vpc.subnet_id
    ec2secgroup = module.securitygroup.ec2secgroup
    key_name = var.key_name
    region=var.region
    instance_state=var.instance_state
}
module "Routes" {
    source = "../modules/Routes"
    vpc_id=module.vpc.vpc_id
    internet_gateway_id=module.vpc.internet_gateway_id
    subnet_id=module.vpc.subnet_id
    route_table_id = module.Routes.route_table_id
    vpc_cidr = var.vpc_cidr
   
}

# module "Routes" {
#   source             = "./modules/Routes"
#   vpc_id             = module.vpc.vpc_id
#   internet_gateway_id = module.vpc.internet_gateway_id
#   subnet_id          = module.vpc.subnet_id

# }

module "eip" {
    source = "../modules/Existing_eip"
    instance_id = module.ec2.instance_id
}