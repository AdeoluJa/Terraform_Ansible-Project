provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

# Using Count to Create 3 EC2 Instances
resource "aws_instance" "server" {
  count                  = 3
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.ami_key_pair_name
  vpc_security_group_ids = [aws_security_group.terra_security_group.id]
  subnet_id              = aws_subnet.terra-public-subnet-1.id

  tags = {
    Name = "${element(var.instance_name, count.index)}"
  }
}

# Exporting the IP Addresses from the EC2 Instances in a file name 'host-inventory'
resource "local_file" "host-inventory" {
  content = <<-DOC
    [webservers]
    ${aws_instance.server[0].public_ip}
    ${aws_instance.server[1].public_ip}
    ${aws_instance.server[2].public_ip}

    [webservers:vars]
    ansible_ssh_user=ubuntu
    ansible_ssh_private_key_file=/home/vagrant/terraform/ansible/your_keypair
    ansible_ssh port=22
    DOC

  filename = "/home/vagrant/terraform/ansible/host-inventory"
}
