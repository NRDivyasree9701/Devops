module "ec2_instance" {
  source           = "../module/ec2_instance"
  instance_type    = var.instance_type
  ami_id           = var.ami_id
  environment      = var.environment
  public_subnet_id = module.net_com.public_subnet_id
  key_name         = var.key_name
  instance_state = var.instance_state
  security_group_ids= values(module.sec_group.security_group_ids)
}

module "net_com" {
  source                    = "../module/net_com"
  environment               = var.environment
  vpc_cidr                  = var.vpc_cidr
  public_subnet_cidr        = var.public_subnet_cidr
  private_subnet_cidr       = var.private_subnet_cidr
  public_availability_zone  = var.public_availability_zone
  private_availability_zone = var.private_availability_zone
}

module "sec_group" {
  source = "../module/sec_group"

  vpc_id          = module.net_com.vpc_id
  security_groups = var.security_groups
}

module "nacl" {
  source        = "../module/nacl"
  environment   = var.environment
  ingress_rules = var.ingress_rules
  egress_rules  = var.egress_rules
  vpc_id        = module.net_com.vpc_id
  nacl_name = var.name
  subnet_id = module.net_com.private_subnet_id
}

# module "nacl2" {
#   source      = "../module/nacl2"
#   vpc_id      = module.net_com.vpc_id
#   nacl_groups = var.nacl_groups
# }
