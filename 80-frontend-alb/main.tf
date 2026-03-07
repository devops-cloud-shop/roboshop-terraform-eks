resource "aws_lb" "ingress_alb" {
  name               = "${local.common_name_suffix}-ingress-alb" #roboshop-dev-ingress-alb
  internal           = false
  load_balancer_type = "application"
  security_groups    = [local.ingress_alb_sg_id]
  subnets            = local.public_subnet_ids

  enable_deletion_protection = false  #true-prevents accidental deletion fron UI

  tags = merge(
    local.common_tags,
    {
        Name = "${local.common_name_suffix}-ingress-alb"
    }
  )
}

#ingress ALB listening on port 443
resource "aws_lb_listener" "ingress_alb" {
  load_balancer_arn = aws_lb.ingress_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-3-2021-06"
  certificate_arn   = local.ingress_alb_certificate_arn
  
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Hi, I'm from HTTPS frontend ALB"
      status_code  = "200"
    }
  }
}

#route53 record for alb
resource "aws_route53_record" "ingress_alb" {
  zone_id = var.zone_id
  name    = "*.${var.domain_name}" #*.prav4cloud.online
  type    = "A"
  allow_overwrite = true

  alias {
    # These are ALB details, not our domain details
    name                   = aws_lb.ingress_alb.dns_name
    zone_id                = aws_lb.ingress_alb.zone_id
    evaluate_target_health = true
  }
}  