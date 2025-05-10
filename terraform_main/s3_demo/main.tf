module "s3_bucket" {
    source = "./modules/s3"
    bucket = var.bucket
}