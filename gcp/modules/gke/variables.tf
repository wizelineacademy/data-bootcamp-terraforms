# --- variables.tf/gcp/modules/gke
variable "project_id" {}
variable "region" {}
variable "account_id" {}
variable "service_name" {}
variable "gke_num_nodes" {
  description = "number of gke nodes"
}
variable "machine_type" {}
variable "private_subnets" {}
variable "network" {}