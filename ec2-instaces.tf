variable "ami_id" {
  description = "AMI ID for instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "Name of the key pair for SSH access"
  type        = string
}






# Create an EC2 instance for web tier
resource "aws_instance" "my_web_instance" {
  ami           = var.ami_id  # Specify your desired AMI ID
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  subnet_id = aws_subnet.my_subnets[0].id
  associate_public_ip_address = "true"


  tags = {
    Name = "my-web-instance"
  }
}


# Create an EC2 instance app tier
resource "aws_instance" "my_app_instance" {
  ami           = var.ami_id  # Specify your desired AMI ID
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  subnet_id = aws_subnet.my_subnets[1].id
  associate_public_ip_address = "true"

  tags = {
    Name = "my-app-instance"
  }
}








