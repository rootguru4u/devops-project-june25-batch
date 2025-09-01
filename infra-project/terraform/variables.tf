variable "aws_region" { default = "ap-south-1" }
variable "vpc_cidr"   { default = "10.0.0.0/16" }

variable "db_username" {}
variable "db_password" {
  sensitive = true
}