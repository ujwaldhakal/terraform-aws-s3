resource "aws_s3_bucket" "demo-buck-123" {
  bucket = "demo-buck-123"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
