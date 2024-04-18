terraform {
  backend "s3" {
    bucket = "aijan-bucket"
    key    = "state_file/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "lock-state"
  }
  }
