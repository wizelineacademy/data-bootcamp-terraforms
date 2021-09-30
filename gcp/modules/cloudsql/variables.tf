variable "instance_name" {
  description = "Name for the sql instance database"
}

variable "region" {
  description = "Region where the instance will live"
}

variable "instance_tier" {
  description = "Sql instance tier"
}

variable "disk_space" {
  description = "Size of the disk in the sql instance"
}

variable "database_name" {
  description = "Name for the database to be created"
}