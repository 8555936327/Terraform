

resource "aws_nat_gateway" "my_app_nat_gateway" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.my_subnets[1].id
}

resource "aws_nat_gateway" "my_db_nat_gateway" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.my_subnets[2].id
}


