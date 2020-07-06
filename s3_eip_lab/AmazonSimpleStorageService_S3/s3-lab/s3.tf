resource "aws_s3_bucket" "olivier-s3-bucket" {
  bucket = "terraform-s3bucket-2020-06-28"
  acl    = "public-read"

  tags = {
    Name        = "Olis bucket"
    Environment = "Dev"
  }
}
