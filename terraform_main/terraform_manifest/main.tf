data "aws_instance" "existing_instance" {
  filter {
    name   = "tag:Name"
    values = ["instance3"]
  }
  filter {
    name   = "instance-state-name"
    values = ["running"]
  }
}

resource "null_resource" "cluster" {
    triggers = {
      instance_id = data.aws_instance.existing_instance.id
    }
    # depends_on = [data.aws_instance.existing_instance]
  connection {
    type        = "ssh"
    host        = data.aws_instance.existing_instance.public_ip
    user        = "ubuntu"
    private_key = file("../private_key/ubuntu.pem")
  }

  provisioner "file" {
    source      = "../private_key/ubuntu.pem"
    destination = "/tmp/ubuntu.pem"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/ubuntu.pem"
    ]
  }

  provisioner "local-exec" {
  command = "PowerShell -Command \"echo 'Provisioners are working!' >> hi.txt\""
  working_dir = "local_output/"
   # on_failure = continue
    # when = destroy

}

   
  }









