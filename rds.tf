# Declare variables

# Declare variables for RDS instance

variable "identifier" {
    type = string
}

variable "engine" {
    type = string 
}

variable "engine_version" {
    type = number 
}

variable "allocated_storage" {
    type = number
}

variable "instance_class" {
    type = string
}

variable "username" {
    type = string  
}

variable "password" {
    type = string 
}




# Create DB Subnet Group

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db_subnet_group"
  subnet_ids = [aws_subnet.my_subnets[1].id,aws_subnet.my_subnets[2].id]
}

# Create RDS instance for the database tier
resource "aws_db_instance" "db_instance" {
  identifier            = var.identifier
  engine                = var.engine
  engine_version        = var.engine_version
  allocated_storage     = var.allocated_storage
  instance_class        = var.instance_class
  username              = var.username
  password              = var.password
  publicly_accessible   = false
  multi_az              = false
  final_snapshot_identifier = false
  skip_final_snapshot = true
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  tags = {
    Name = "db_instance"
  }
  
}