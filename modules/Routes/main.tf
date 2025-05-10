resource "aws_route_table" "route_table" {
    vpc_id = var.vpc_id
}

#this is route for internal access
# resource "aws_route" "route"{
#     destination_cidr_block = var.vpc_cidr
#     route_table_id = var.route_table_id
#     gateway_id = "local"
# }

# #this is the route for internet access
resource "aws_route" "internet_route" {
    destination_cidr_block = "0.0.0.0/0"
    route_table_id = var.route_table_id
    gateway_id = var.internet_gateway_id
}

resource "aws_route_table_association" "subnet_association"{
    subnet_id = var.subnet_id 
    route_table_id = var.route_table_id
}