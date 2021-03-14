resource "aws_lb" "alb_nginx" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = var.alb_type
  security_groups    = [data.terraform_remote_state.sgs.outputs.alb_securitygroup_output.sg_id]
  subnets            = [var.subnet1, var.subnet2]

  enable_deletion_protection = false

  tags = {
    Name    = "alb-nginx"
    Project = "iob-test"
  }
}

resource "aws_lb_target_group" "nginx_tg" {
  name        = var.nginx_tg_name
  port        = var.nginx_tg_port
  protocol    = var.nginx_tg_protocol
  vpc_id      = var.vpc_id
  target_type = var.target_type
}

resource "aws_lb_listener" "nginx_listener" {
  load_balancer_arn = aws_lb.alb_nginx.arn
  port              = var.nginx_listener_port
  protocol          = var.nginx_listener_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginx_tg.arn
  }
}

resource "aws_lb_listener_rule" "static" {
  listener_arn = aws_lb_listener.nginx_listener.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginx_tg.arn
  }

  condition {
    host_header {
      values = ["*test.iregueiro.io.builders"]
    }
  }

}

resource "aws_lb_target_group_attachment" "target_to_nginx" {
  target_group_arn = aws_lb_target_group.nginx_tg.arn
  target_id        = data.terraform_remote_state.nginx.outputs.nginx_instance_id
  depends_on       = [aws_lb_target_group.nginx_tg]
}