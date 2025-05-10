output "bucket" {
    value = aws_s3_bucket.bucket.id
}
output "bucket_arn" {
    value = aws_s3_bucket.bucket.arn
}
output "region" {
    value = aws_s3_bucket.bucket.region
}
output "domain_name" {
    value = aws_s3_bucket.bucket.bucket_domain_name
}