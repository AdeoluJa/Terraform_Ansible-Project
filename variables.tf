variable "access_key" {
  description = "The Access Key"
  default     = [{}]
}

variable "secret_key" {
  description = "The Secret Key"
  default     = [{}]
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ami_id" {
  type    = string
  default = "ami-00874d747dde814fa"
}

variable "ami_key_pair_name" {
  type    = string
  default = "terra"
}

variable "instance_name" {
  type    = list(any)
  default = ["Server-A", "Server-B", "Server-C"]
}

variable "inbound_ports" {
  type    = list(any)
  default = [80, 443]
}

variable "public_subnet_cidr_blocks" {
  type    = list(any)
  default = ["10.0.0.0/24", "10.0.2.0/24"]
}

variable "domain_name" {
  description = "Domain name"
  default     = "adeoluja.live"
  type        = string
}
