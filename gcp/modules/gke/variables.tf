# --- variables.tf/gcp/modules/gke
variable "project_id" {}
variable "region" {}
variable "account_id" {}
variable "service_name" {}
variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "gke_num_nodes" {
  description = "number of gke nodes"
}

variable "machine_type" {}
variable "private_subnets" {}
variable "network" {}