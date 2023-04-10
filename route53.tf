# Create hostedzone
resource "aws_route53_zone" "hosted_zone" {
  name = var.domain_name
}

# Attached the subdomain and shows the ALB
resource "aws_route53_record" "site_domain" {
  zone_id = aws_route53_zone.hosted_zone.zone_id
  name    = "terraform-test.${var.domain_name}"
  type    = "A"

  alias {
    name                   = aws_lb.terra_alb.dns_name
    zone_id                = aws_lb.terra_alb.zone_id
    evaluate_target_health = true
  }
}