resource "tls_private_key" "new_key" {
    algorithm = "RSA"
    rsa_bits = 4096
}

resource "aws_key_pair" "aws_key" {
    key_name   = "aws_key"
    public_key = tls_private_key.new_key.public_key_openssh
}

#to save the local file locally 

resource "local_file" "private_key" {
    content  = tls_private_key.new_key.private_key_pem
    file_permission = 0600
    filename = "${path.module}/aws_key.pem"
 
}