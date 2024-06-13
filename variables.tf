variable "instance_count" {
    default = 2
}

variable "ami_value" {
    default = "ami-03f4878755434977f"
}
variable "instance_type" {
    default = "t2.micro"
}

variable "aws_region" {
    default = "ap-south-1"
}

variable "environment_name" {
    default = "uat"
}

variable "project_name" {
    default = "netcat"  
}

variable "sg_name" {
    default = "ec2-sg"
  
}

variable "cluster_name" {
    default = "infieks"
  
}

# EKS

variable "cluster_iam_role_name" {
    default = "eks-role"
    
  
}

variable "cluster_iam_role_policy" {
    default = {
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  }
  
}


# Node group

variable "node_group_name" {
    default = "eks-workers"
  

}

variable "node_iam_role" {
    default = "node-group"
  
}

variable "node_iam_role_policy" {
    default = {
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  }

}