# --- variables.tf/modules/aws/rds
variable "allocated_storage" {
  description = "Space in disk for the database, stay in the range 5-10 to stay in free tier"
}
variable "db_engine" {
  description = "Database instance type"
}
variable "engine_version" {
  description = "Engine version"
}
variable "instance_type" {
  description = "Type for the rds instance, set db.t3.micro to stay in the free tier"
}
variable "database_name" {
  description = "Name for the rds database"
}
variable "db_username" {
  description = "Username credentials for root user"
}
variable "db_password" {
  description = "Password credentials for root user"
}
variable "private_subnet" {
  description = "Private subnet where the rds instance is going to be placed"
}
variable "service_sg" {
  description = "Security group of the service which is going to connect to the database"
}
variable "publicly_accessible" {
  description = "Variable that set the instance to be accessible publicly"
}