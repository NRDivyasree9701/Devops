output "key_name" {
    value = aws_key_pair.aws_key.key_name
}
 
output "private_key_loc" {
    value = local_file.private_key.filename
}