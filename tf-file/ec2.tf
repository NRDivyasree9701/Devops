#ANI EC2
resource "aws_instance" "web1" {
   ami                         = var.ami_id
  instance_type               = var.instance_type
   associate_public_ip_address = true
   subnet_id                   = aws_subnet.pubsub1.id
   vpc_security_group_ids      = [aws_security_group.pub-seg.id]
   key_name                    = "ani-demo-key"
#   user_data                   = file("web-apps.sh")

    # provisioner "local-exec" {
    #     command = "echo ${self.public_ip} > ec2_public_ip.txt"
    #     working_dir = "${path.module}"
    # }
#     provisioner "local-exec" {
#     command = "echo ${self.public_ip} > ${path.module}/ec2_public_ip.txt"
#     interpreter = ["/bin/bash", "-c"]
#   }

# provisioner "local-exec" {
#   command = "echo ${self.public_ip} > ${path.module}\\ec2_public_ip.txt"
#   #interpreter = ["cmd.exe", "/c"] 
#   when = create
# }

# provisioner "local-exec" {
#   command = "echo ${self.public_ip} > ${path.module}\\ec2_public_ip.txt"
#   interpreter = ["powershell.exe", "-Command"]
#   when = create
# }
# provisioner "local-exec" {
#   command = "echo ${self.public_ip} >> server_ip.txt"
#   interpreter = ["powershell.exe", "-Command"]
 
# #   environment = {
# #     WORKSPACE = var.workspace
   
# #   }
 
#   when = create
# }




   tags = {
     Name        = "ANI-demo"
     Project     = "ANI"
     Environment = "dev"
   }
 }

 resource "aws_ec2_instance_state" "ec2_state" {
  instance_id = aws_instance.web1.id
  state       = var.instance_state
}



 output "public_ip" {
  value = aws_instance.web1.public_ip
}