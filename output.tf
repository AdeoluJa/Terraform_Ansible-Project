output "instance_public_ip" {
  description = "Public IP address of the Server A EC2 instance"
  value = [
    aws_instance.server[0].public_ip,
    aws_instance.server[1].public_ip,
    aws_instance.server[2].public_ip
  ]
}

output "alb_dns_name" {
  description = "ALB DNS Name"
  value       = aws_lb.terra_alb.dns_name
}
