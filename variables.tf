# Provider VARs
variable "access_key" {}

variable "secret_key" {}

variable "region" {
  default = "us-east-1"
}

# Instance VARs
variable "vpc_id" {}
variable "subnet_id" {}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami" {
  description = "Ubuntu 18.04 LTS AMI in AWS us-east-1 region"
  default     = "ami-085925f297f89fce1"
}

variable "fqdn" {}
