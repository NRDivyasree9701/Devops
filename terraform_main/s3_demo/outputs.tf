output "bucket" {
  value = module.s3_bucket.bucket
}
output "bucket_arn" {
    value = module.s3_bucket.bucket_arn
}
output "domain_name" {
    value = module.s3_bucket.domain_name
}
output "region" {
    value = module.s3_bucket.region
}
