output "elastic_ip"{
    value = data.aws_eip.existing_eip.public_ip
}

output "eip_allocation_id"{
    value = data.aws_eip.existing_eip.id
}



