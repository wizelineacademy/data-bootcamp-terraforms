output "worker_security_group_id" {
  description = "Security group ID attached to the EKS workers"
  value       = module.eks.worker_security_group_id
}