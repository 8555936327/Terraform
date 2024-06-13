

  
# Declare variables
variable "subnet_names" {
  description = "List of subnet names"
  type        = list(string)
}


variable "subnet_cidr_blocks" {
  description = "List of subnet CIDR blocks"
  type        = list(string)
}

variable "subnet_availability_zones" {
  description = "List of subnet availability zones"
  type        = list(string)
}



# Create subnets
resource "aws_subnet" "my_subnets" {
  count                  = length(var.subnet_names)
  cidr_block             = var.subnet_cidr_blocks[count.index]
  availability_zone      = var.subnet_availability_zones[count.index]
  vpc_id                 = aws_vpc.my_vpc.id
  map_public_ip_on_launch = count.index == 0  # Only public subnet should have public IPs

  tags = {
    Name = var.subnet_names[count.index]
  }
}




# Display the subnet IDs

output "subnet_ids" {
  value = aws_subnet.my_subnets[*].id
  
}










