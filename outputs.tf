output "storage_account_id" {
  description = "The ID of the storage account."
  value       = azurerm_storage_account.main.id
}

output "storage_account_name" {
  description = "The name of the storage account."
  value       = azurerm_storage_account.main.name
}

output "storage_account_primary_blob_endpoint" {
  description = "The primary blob endpoint."
  value       = azurerm_storage_account.main.primary_blob_endpoint
}

output "storage_account_primary_web_endpoint" {
  description = "The primary web endpoint for static websites (if enabled)."
  value       = azurerm_storage_account.main.primary_web_endpoint
}

output "storage_account_primary_connection_string" {
  description = "The primary connection string for the storage account."
  value       = azurerm_storage_account.main.primary_connection_string
  sensitive   = true
}

output "storage_account_primary_access_key" {
  description = "The primary access key for the storage account."
  value       = azurerm_storage_account.main.primary_access_key
  sensitive   = true
}

output "storage_account_secondary_access_key" {
  description = "The secondary access key for the storage account."
  value       = azurerm_storage_account.main.secondary_access_key
  sensitive   = true
}
