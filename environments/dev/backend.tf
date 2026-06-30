terraform {
  backend "s3" {
    bucket         = "stellar-terraform-state-pixis"
    key            = "Stellar/dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile   = true
  }
}
