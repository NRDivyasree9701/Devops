variable "description" {
  type=string
}
variable "enable_key_rotation"{
    type = bool
}
variable "deletion_window_in_days" {
    type = number
}
variable "kms_alias_name" {
    type = string
}
variable "target_key_id" {
    type = string
}