# Declare variables

variable "internet_gateway_name" {
    description = "Name for the igw"
    type = string
}

# Create Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "var.internet_gateway_name"
  }
}

