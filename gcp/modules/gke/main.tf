# --- main.tf/gcp/modules/gke
resource "google_service_account" "default_account" {
  account_id   = var.account_id
  display_name = var.service_name
}
resource "google_container_cluster" "main_cluster" {
  name                     = "${var.project_id}-gke-cluster"
  project                  = var.project_id
  location                 = var.region
  network                  = var.network
  subnetwork               = var.private_subnets
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_node" {
  cluster    = google_container_cluster.main_cluster.self_link
  location   = var.region
  node_count = var.gke_num_nodes

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    service_account = google_service_account.default_account.account_id
    oauth_scopes    = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      env = var.project_id
    }

    machine_type = var.machine_type
    tags         = [
      "gke-node",
      "${var.project_id}-gke"]

  }


}