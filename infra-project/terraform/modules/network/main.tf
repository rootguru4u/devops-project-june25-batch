resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets" {
  value = ["subnet-12345", "subnet-67890"]
}

output "alb_sg" {
  value = "sg-12345678"
}
