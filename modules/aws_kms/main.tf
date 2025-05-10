resource "aws_kms_key" "aws_key" {
  description             = var.description
  enable_key_rotation     = var.enable_key_rotation
  deletion_window_in_days = var.deletion_window_in_days
}

resource "aws_kms_alias" "alias" {
    name=var.kms_alias_name
    target_key_id = var.target_key_id
}