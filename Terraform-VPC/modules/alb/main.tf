#ALB
resource "aws_lb" "terraform-alb" {
  name               = "Application-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_id]
  subnets            = var.subnets
}

#Listeners
resource "aws_lb_listener" "terraform_listener" {
  load_balancer_arn = aws_lb.terraform-alb.arn
  port              = "80"
  protocol          = "HTTP"
#  ssl_policy        = "ELBSecurityPolicy-2016-08"
#  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.terraform-tg.arn
  }
}

#Target group
resource "aws_lb_target_group" "terraform-tg" {
  name     = "terraform-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

#Target group atatchment
resource "aws_lb_target_group_attachment" "terraform-tga" {
  count = length(var.instances)
  target_group_arn = aws_lb_target_group.terraform-tg.arn
  target_id        = var.instances[count.index]
  port             = 80
}

