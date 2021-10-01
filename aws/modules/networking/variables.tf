variable "vpc_cidr" {
  type = string
  description = "IP Ranges for the VPC"
}

variable "public_subnets_cidr" {
  type = string
  description = "IP Ranges for the Public Subnet"
}

variable "private_subnets_cidr" {
  type = string
  description = "IP Ranges for the Private Subnet"
}