resource "aws_lb" "network_load_balancer" {
  name               = "my-nlb"
  internal           = false
  load_balancer_type = "network"
  subnets            = var.public_subnets      # Use your public subnets variable
  enable_deletion_protection = false
  tags = {
    Name = "my-nlb"
  }
}

resource "aws_lb_listener" "nlb_listener" {
  load_balancer_arn = aws_lb.network_load_balancer.arn
  port              = 80
  protocol          = "TCP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.nlb_target_group.arn
  }
}

resource "aws_lb_target_group" "nlb_target_group" {
  name     = "nlb-target-group"
  port     = 80
  protocol = "TCP"
  vpc_id   = var.vpc_id  # Use your VPC ID variable
  target_type   = "instance"
}
resource "aws_lb_target_group_attachment" "nlb_attachment" {
  count           = length(var.public_instance_ids)
  target_group_arn = aws_lb_target_group.nlb_target_group.arn
  target_id        = element(var.public_instance_ids, count.index)
  port             = 80
}

resource "aws_lb" "application_load_balancer" {
  name               = "my-alb"
  internal           = true
  load_balancer_type = "application"
 security_groups = [var.alb_sg]  # Use your security group variable
  subnets            = var.private_subnets      # Use your private subnets variable

  enable_deletion_protection = false

  tags = {
    Name = "my-alb"
  }
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}

resource "aws_lb_target_group" "alb_target_group" {
  name     = "alb-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id  # Use your VPC ID variable
  target_type   = "instance"
}
resource "aws_lb_target_group_attachment" "alb_attachment" {
  count           = length(var.private_instance_ids)
  target_group_arn =  aws_lb_target_group.alb_target_group.arn
  target_id        = element(var.private_instance_ids, count.index)
  port             = 80
}
