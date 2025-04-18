locals {
  default_tags = {
    environment = "dev"
    project     = "storage-module"
  }

  storage_ip_rules = [
    for ip in var.network_bypass :
    ip if can(regex("^\\d+\\.\\d+\\.\\d+\\.\\d+$", ip)) # simple IPv4 check
  ]

  pitr_enabled = (
    var.blob_data_protection != null &&
    var.blob_data_protection.container_delete_retention_policy_in_days > 0
  )
}

