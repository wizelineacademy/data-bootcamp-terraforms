resource "google_sql_database_instance" "sql_instance" {
  name   = var.instance_name
  region = var.region

  settings {
    tier      = var.instance_tier
    disk_size = var.disk_space
  }

  deletion_protection = "false"
}

resource "google_sql_database" "database" {
  name     = var.database_name
  instance = google_sql_database_instance.sql_instance.name
}