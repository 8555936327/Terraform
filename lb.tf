# Declare variables
variable "name" {
    description = "name for lb"
    type = string
}

variable "internal" {
    type = bool
}

variable "load_balancer_type" {
    description = "to specify the lb type"
    type = string
  
}

variable "enable_deletion_protection" {
    description = "for deletion protection"
    type = bool  
}


resource "aws_lb" "mylb" {
  name               = "mylb-front-end"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [aws_subnet.my_subnets[0].id,aws_subnet.my_subnets[1].id]
  enable_deletion_protection = false

enable_http2          = true
    idle_timeout          = 60
    enable_cross_zone_load_balancing = true

  
}


resource "aws_lb_target_group" "nginx_target_group" {
    name        = "nginx-target-group"
    port        = 80
    protocol    = "HTTP"
    target_type = "instance"
    vpc_id      = aws_vpc.my_vpc.id
}

resource "aws_lb_listener" "nginx_listener" {
    load_balancer_arn = aws_lb.mylb.arn
    port              = 80
    protocol          = "HTTP"

    default_action {
        target_group_arn = aws_lb_target_group.nginx_target_group.arn
        type             = "forward"
    }
}


resource "aws_lb_target_group_attachment" "nginx_attachment1" {
    target_group_arn = aws_lb_target_group.nginx_target_group.arn
    target_id        = aws_instance.my_web_instance.id
}

resource "aws_lb_target_group_attachment" "nginx_attachment2" {
    target_group_arn = aws_lb_target_group.nginx_target_group.arn
    target_id        = aws_instance.my_app_instance.id
}