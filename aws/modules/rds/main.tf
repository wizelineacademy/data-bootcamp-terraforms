# --- main.tf/modules/aws/rds
resource "aws_db_subnet_group" "db_subnet" {
  name       = "rds-subnet"
  subnet_ids = [var.subnet_rds]
  tags = {
    Name = "rds-db"
  }
}
resource "aws_db_instance" "rds-instance" {
  allocated_storage      = var.allocated_storage
  storage_type           = "gp2"
  engine                 = var.db_engine
  engine_version         = var.engine_version
  instance_class         = var.instance_type
  name                   = var.database_name
  username               = var.db_username
  password               = var.db_password
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.db_subnet.name
  publicly_accessible = var.publicly_accessible
  vpc_security_group_ids = [
    var.service_sg]

  tags = {
    Name = "rds-database"
  }
}
