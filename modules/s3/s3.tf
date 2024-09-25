resource "aws_s3_bucket" "project_s3" {
  bucket = "projectterafform"

  tags = {
    Name        = "Project Bucket"
    Environment = "Dev"
  }
}
