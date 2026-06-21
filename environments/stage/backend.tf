terraform {
  backend "s3" {
    bucket         = "orcalo-terraform-remotebackend-s3"
    key            = "agenticcreed/stage/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}
