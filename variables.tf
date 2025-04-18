variable "storage_name" {
  type        = string
  description = "The name of the  storage account."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the storage account."
}

variable "location" {
  type        = string
  description = "The Azure location where the storage account will be created."
}

variable "account_tier" {
  type        = string
  description = "Defines the Tier to use for this storage account (Standard or Premium)."
}

variable "account_kind" {
  type        = string
  description = "The Kind of account (Storage, StorageV2, BlobStorage, etc)."
}

variable "account_replication_type" {
  type        = string
  description = "The type of replication to use for this storage account."
}

variable "access_tier" {
  type        = string
  description = "The access tier for BlobStorage/StorageV2 accounts (Hot or Cool)."
  default     = null
}

variable "min_tls_version" {
  type        = string
  description = "The minimum TLS version to be permitted on requests to storage."
  default     = "TLS1_2"
}

variable "public_nested_items_allowed" {
  type        = bool
  description = "Allow or disallow public access to all blobs or containers."
  default     = false
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Enable or disable public network access."
  default     = true
}

variable "shared_access_key_enabled" {
  type        = bool
  description = "Enable or disable shared access key authorization."
  default     = true
}

variable "sftp_enabled" {
  type        = bool
  description = "Enable or disable SFTP."
  default     = false
}

variable "nfsv3_enabled" {
  type        = bool
  description = "Enable or disable NFSv3 protocol."
  default     = false
}

variable "hns_enabled" {
  type        = bool
  description = "Enable or disable Hierarchical Namespace (Data Lake Gen2)."
  default     = false
}

variable "https_traffic_only_enabled" {
  type        = bool
  description = "Enable or disable HTTPS traffic only."
  default     = true
}

variable "cross_tenant_replication_enabled" {
  type        = bool
  description = "Whether cross tenant replication is enabled."
  default     = false
}

variable "infrastructure_encryption_enabled" {
  type        = bool
  description = "Enable infrastructure encryption for the storage account."
  default     = false
}

variable "allowed_copy_scope" {
  type        = string
  description = "Restrict copy operations to within or across Azure AD tenants."
  default     = null
}

variable "identity_type" {
  type        = string
  description = "The type of managed identity to use (SystemAssigned, UserAssigned, etc)."
  default     = null
}

variable "identity_ids" {
  type        = list(string)
  description = "A list of user-assigned identity IDs."
  default     = []
}

variable "static_website_config" {
  type = object({
    index_document     = string
    error_404_document = string
  })
  description = "Configuration for static website hosting."
  default     = null
}

variable "custom_domain_name" {
  type        = string
  description = "The custom domain name to use."
  default     = null
}

variable "use_subdomain" {
  type        = bool
  description = "Whether to use indirect CNAME validation."
  default     = false
}

variable "customer_managed_key" {
  type = object({
    key_vault_key_id          = string
    managed_hsm_key_id        = string
    user_assigned_identity_id = string
  })
  description = "Customer-managed key configuration."
  default     = null
}

variable "blob_data_protection" {
  type = object({
    change_feed_enabled                       = bool
    change_feed_retention_in_days             = number
    versioning_enabled                        = bool
    last_access_time_enabled                  = bool
    delete_retention_policy_in_days           = number
    container_delete_retention_policy_in_days = number
  })
  description = "Blob data protection settings."
  default     = null
}

variable "blob_cors_rules" {
  type = list(object({
    allowed_headers    = list(string)
    allowed_methods    = list(string)
    allowed_origins    = list(string)
    exposed_headers    = list(string)
    max_age_in_seconds = number
  }))
  description = "CORS rules for blob service."
  default     = []
}

variable "queue_properties_logging" {
  type = object({
    delete                = bool
    read                  = bool
    write                 = bool
    version               = string
    retention_policy_days = number
  })
  description = "Logging properties for the queue service."
  default     = null
}

variable "file_share_cors_rules" {
  type = list(object({
    allowed_headers    = list(string)
    allowed_methods    = list(string)
    allowed_origins    = list(string)
    exposed_headers    = list(string)
    max_age_in_seconds = number
  }))
  description = "CORS rules for the file service."
  default     = []
}

variable "file_share_retention_policy_in_days" {
  type        = number
  description = "Number of days to retain deleted files."
  default     = null
}

variable "file_share_properties_smb" {
  type = object({
    authentication_types            = list(string)
    channel_encryption_type         = string
    kerberos_ticket_encryption_type = string
    versions                        = list(string)
    multichannel_enabled            = bool
  })
  description = "SMB settings for file share."
  default     = null
}

variable "file_share_authentication" {
  type = object({
    directory_type = string
    active_directory = optional(object({
      storage_sid         = string
      domain_name         = string
      domain_sid          = string
      domain_guid         = string
      forest_name         = string
      netbios_domain_name = string
    }))
  })
  description = "Azure Files authentication settings."
  default     = null
}

variable "network_bypass" {
  type        = list(string)
  description = "A list of services to bypass network rules for."
  default     = []
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for virtual network access."
  default     = []
}

variable "private_link_access" {
  type = list(object({
    endpoint_resource_id = string
    endpoint_tenant_id   = string
  }))
  description = "Private link access rules."
  default     = []
}

variable "extra_tags" {
  type        = map(string)
  description = "Additional tags to apply to the storage account."
  default     = {}
}
