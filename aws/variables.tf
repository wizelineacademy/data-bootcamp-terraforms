variable "region" {
  description = "AWS Deployment region.."
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnets_cidr" {
  type = list(string)
}

variable "private_subnets_cidr" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}

variable "destination_cidr_block" {
  type = string
  default = "0.0.0.0/0"
}