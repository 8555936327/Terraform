
# Declare variables
variable "route_table_names" {
  description = "List of route table names"
  type        = list(string)
}

# Create route tables
resource "aws_route_table" "my_route_tables" {
  count      = length(var.route_table_names)
  vpc_id     = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id 
  }

  tags = {
    Name = var.route_table_names[count.index]
  }
}




# Declare variables
  variable "route_table_associations" {
    description = "list of route table associations"
    type = list(string)
  }

# create route table associations

resource "aws_route_table_association" "my_route_table_associations" {
    count = length(var.route_table_associations)
  subnet_id      = aws_subnet.my_subnets[count.index].id
  route_table_id = aws_route_table.my_route_tables[count.index].id
}




