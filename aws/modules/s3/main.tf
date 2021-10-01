resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.BUCKET_NAME
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
  versioning {
    enabled = false
  }

    lifecycle_rule {
    enabled = true

    transition {
      days          = 30
      storage_class = var.STORAGE_CLASS_1 
    }

    transition {
      days          = 60
      storage_class = var.STORAGE_CLASS_2
    }

    expiration {
      days = 90
    }
  }

// Enable Server-Side encryption
server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.mykey.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }


}