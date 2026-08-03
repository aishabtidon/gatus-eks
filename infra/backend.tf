terraform {
  backend "s3" {
    bucket         = "aishabtidon-gatus-tfstate-141899078890"
    key            = "gatus-eks/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
