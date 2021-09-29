output "cluster_endpoint" {
  value = google_container_cluster.main_cluster.endpoint
}

output "cluster_name" {
  value = google_container_cluster.main_cluster.name
}