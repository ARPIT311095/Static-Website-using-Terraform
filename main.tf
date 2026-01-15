terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.28.0"
    }
    
random = {
      source = "hashicorp/random"
      version = "3.8.0"
    }

  }
  /*
  backend "s3" {    # tfstate jo file hain usko cloud s3 bucket me store karna ye terraform kr andar rahega
    bucket = "parth-bucket-7b3e33fe1bc8756a"
    key = "backed.tfstate"
    region = "us-east-1"
  }
  */
}

 

# kis region me kaam karna hain wo bata raha hu
provider "aws" {
    region = "us-east-1"   # Configuration options
}

resource "random_id" "rand_id" {  # Random resource for display the random ID 
  byte_length = 8
}

resource "aws_s3_bucket" "Demo-bucket" {       # bucket details
  bucket = "parth-bucket-${random_id.rand_id.hex}"
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "access-off" {
  bucket = aws_s3_bucket.Demo-bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.Demo-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_policy" "bucket-policy" {
  bucket = aws_s3_bucket.Demo-bucket.id
   policy = jsonencode(                            # jsoneencode ye jeson form me conver kar dega
{
  Version= "2012-10-17",       # is policy me : isko hata ke "" or isko bhi sab ko = me likhana hain
  Statement= [
    {
      Sid= "PublicReadGetObject",
      Effect= "Allow",
      Principal= "*",
      Action= "s3:GetObject",
      Resource= "arn:aws:s3:::${aws_s3_bucket.Demo-bucket.id}/*"
    }
  ]
})
}

resource "aws_s3_bucket_website_configuration" "Website-Permission" {
  bucket = aws_s3_bucket.Demo-bucket.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_object" "Object-data-1" {     # store the data in S3 bucket
  bucket = aws_s3_bucket.Demo-bucket.bucket
  source = "./index.html"
  key    = "index.html"   #key = S3 bucket ke andar file ka naam / path
  content_type = "text/html"
  etag         = filemd5("./index.html")
}

resource "aws_s3_object" "Object-data-2" {     # store the data in S3 bucket
  bucket = aws_s3_bucket.Demo-bucket.bucket
  source = "./style.css"
  key    = "style.css"   #key = S3 bucket ke andar file ka naam / path
  content_type = "text/css"
  etag         = filemd5("./style.css")
}
resource "aws_s3_object" "Object-data-3" {     # store the data in S3 bucket
  bucket = aws_s3_bucket.Demo-bucket.bucket
  source = "./script.js"
  key    = "script.js"   #key = S3 bucket ke andar file ka naam / path
  content_type = "application/javascript"
  etag         = filemd5("./script.js")
}


output "name" {
  #value = random_id.rand_id.hex   # Show the details on display witch is give you on value
  value = aws_s3_bucket_website_configuration.Website-Permission.website_endpoint # ye display pe hi website ka url a jaye uske liye hain
}

