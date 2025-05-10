resource  "aws_eip " "main_eip"{
    domain="vpc"
    instance=var.instance_id

    tags={
        Name = "main_eip"
    }
}

