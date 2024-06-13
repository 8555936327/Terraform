
# variables.tf

variable "vpc_name" {
type = string 
}

variable "cidr_block" {
  type = string
}



# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr_block
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}