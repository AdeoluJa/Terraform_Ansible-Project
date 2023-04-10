# Create Load Balancer
resource "aws_lb" "terra_alb" {
  name                             = "alb"
  internal                         = false
  load_balancer_type               = "application"
  security_groups                  = [aws_security_group.terralb_sg.id]
  subnets                          = [aws_subnet.terra-public-subnet-1.id, aws_subnet.terra-public-subnet-2.id]
  enable_cross_zone_load_balancing = true
  enable_deletion_protection       = false
  depends_on                       = [aws_instance.server[0], aws_instance.server[1], aws_instance.server[2]]
}

# Create Target Group
resource "aws_lb_target_group" "alb-target-group" {
  name        = "alb-target-group"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.terra_vpc.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

# Create Listener
resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.terra_alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-target-group.arn
  }
}

# Create Listener Rule
resource "aws_lb_listener_rule" "alb-listener-rule" {
  listener_arn = aws_lb_listener.alb-listener.arn
  priority     = 1
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-target-group.arn
  }
  condition {
    path_pattern {
      values = ["/"]
    }
  }
}

# Create Attachement
resource "aws_alb_target_group_attachment" "attachment_all" {
  count = length(aws_instance.server)
  target_group_arn = aws_lb_target_group.alb-target-group.arn
  target_id = aws_instance.server[count.index].id
}

