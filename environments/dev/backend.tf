terraform {
  backend "s3" {
    bucket         = "orcalo-terraform-remotebackend-s3"
    key            = "agenticcreed/dev/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    use_lockfile   = true
  }
}
