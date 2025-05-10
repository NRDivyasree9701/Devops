data "aws_eip" "existing_eip"{
    filter {
        name   = "tag:Name"
        values = [ "demo" ]
      
    }
}

resource "aws_eip_association" "eip_attach" {
    instance_id   = var.instance_id
    allocation_id = data.aws_eip.existing_eip.id
}