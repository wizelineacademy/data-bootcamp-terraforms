variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "public_subnets_cidr" {
  type = string
  default = "10.0.1.0/24"
}

variable "private_subnets_cidr" {
  type = string
  default = "10.0.2.0/24"
}

variable "availability_zones" {
  type = string
  default = "us-east-2"
}

variable "destination_cidr_block" {
  type = string
  default = "0.0.0.0/0"
}