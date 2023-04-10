# Create Security Group for Load Balancer
resource "aws_security_group" "terralb_sg" {
  name        = "terralb-sg"
  description = "Security group for the load balancer"
  vpc_id      = aws_vpc.terra_vpc.id

  dynamic "ingress" {
    for_each = var.inbound_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "terra-load-balancer-security-group"
  }
}


# Create Security Group for EC2 Instances
resource "aws_security_group" "terra_security_group" {
  name        = "terra-security-group"
  description = "Allow  TLS inbound traffic"
  vpc_id      = aws_vpc.terra_vpc.id

  dynamic "ingress" {
    for_each = var.inbound_ports
    content {
      from_port       = ingress.value
      to_port         = ingress.value
      protocol        = "tcp"
      cidr_blocks     = ["0.0.0.0/0"]
      security_groups = [aws_security_group.terralb_sg.id]
    }
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    Name = "terra-security-group"
  }
}