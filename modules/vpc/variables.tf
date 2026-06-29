variable "name_prefix" {
  description = "Prefix used for VPC and subnet resource names."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}
