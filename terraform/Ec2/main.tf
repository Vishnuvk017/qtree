provider "aws" {
   region = var.region
   access_key = "AKdfhdfhVI6QGLRZSGF"
  secret_key = "yEtbdmBdfhdfJkvve4C5zl3Dg5anLMyfb+M+"
}
resource "aws_instance" "web" {
ami             = var.ami
instance_type   = var.instance_type
key_name        = var.instance_key
subnet_id       = var.public_subnet_cidr
security_groups = [var.security_groups]
associate_public_ip_address = true
tags = {
  Name = "qtreeinstance"
}
}
