variable "region" {
default = "us-west-2"
}
variable "instance_type" {
default = "t2.micro"
}
variable "instance_key" {
default = "ore" 
}
variable "public_subnet_cidr" {
  default = "subnet-009686e0cec3ae360" //subnet ID
}
variable "security_groups" {
default = "sg-067ee579d5edc71ee" // security group ID
}
variable "ami" {
default = "ami-03f65b8614a860c29" // AMI ID
}
