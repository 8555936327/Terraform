
resource "aws_eks_cluster" "mycluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.myeks_role.arn

  vpc_config {
    vpc_id             = module.my_vpc.id
    subnet_ids         = module.public.id
    security_group_ids = [aws_security_group.my_sg.id]
  }
}

resource "aws_iam_role" "myeks_role" {
  name               = var.cluster_iam_role_name
  assume_role_policy = var.cluster_iam_role_policy
}







resource "aws_security_group" "my_sg" {
    name = var.sg_name
    description = "sg for ec2 instance"
    vpc_id = module.my_vpc.id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  cidr_blocks  = ["0.0.0.0/0"]
  }
   
   ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

   }


  egress {
   from_port = 0
   to_port   = 0
   protocol  = "-1"
   cidr_blocks = ["0.0.0.0/0"]
  }
}
