# template-terraform
Template repository for all terraform module repositories

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.25.0 |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.25.0 |
## Modules

No modules.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_tier"></a> [access\_tier](#input\_access\_tier) | The access tier for BlobStorage/StorageV2 accounts (Hot or Cool). | `string` | `null` | no |
| <a name="input_account_kind"></a> [account\_kind](#input\_account\_kind) | The Kind of account (Storage, StorageV2, BlobStorage, etc). | `string` | n/a | yes |
| <a name="input_account_replication_type"></a> [account\_replication\_type](#input\_account\_replication\_type) | The type of replication to use for this storage account. | `string` | n/a | yes |
| <a name="input_account_tier"></a> [account\_tier](#input\_account\_tier) | Defines the Tier to use for this storage account (Standard or Premium). | `string` | n/a | yes |
| <a name="input_allowed_copy_scope"></a> [allowed\_copy\_scope](#input\_allowed\_copy\_scope) | Restrict copy operations to within or across Azure AD tenants. | `string` | `null` | no |
| <a name="input_blob_cors_rules"></a> [blob\_cors\_rules](#input\_blob\_cors\_rules) | CORS rules for blob service. | <pre>list(object({<br>    allowed_headers    = list(string)<br>    allowed_methods    = list(string)<br>    allowed_origins    = list(string)<br>    exposed_headers    = list(string)<br>    max_age_in_seconds = number<br>  }))</pre> | `[]` | no |
| <a name="input_blob_data_protection"></a> [blob\_data\_protection](#input\_blob\_data\_protection) | Blob data protection settings. | <pre>object({<br>    change_feed_enabled                       = bool<br>    change_feed_retention_in_days             = number<br>    versioning_enabled                        = bool<br>    last_access_time_enabled                  = bool<br>    delete_retention_policy_in_days           = number<br>    container_delete_retention_policy_in_days = number<br>  })</pre> | `null` | no |
| <a name="input_cross_tenant_replication_enabled"></a> [cross\_tenant\_replication\_enabled](#input\_cross\_tenant\_replication\_enabled) | Whether cross tenant replication is enabled. | `bool` | `false` | no |
| <a name="input_custom_domain_name"></a> [custom\_domain\_name](#input\_custom\_domain\_name) | The custom domain name to use. | `string` | `null` | no |
| <a name="input_customer_managed_key"></a> [customer\_managed\_key](#input\_customer\_managed\_key) | Customer-managed key configuration. | <pre>object({<br>    key_vault_key_id          = string<br>    managed_hsm_key_id        = string<br>    user_assigned_identity_id = string<br>  })</pre> | `null` | no |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Additional tags to apply to the storage account. | `map(string)` | `{}` | no |
| <a name="input_file_share_authentication"></a> [file\_share\_authentication](#input\_file\_share\_authentication) | Azure Files authentication settings. | <pre>object({<br>    directory_type = string<br>    active_directory = optional(object({<br>      storage_sid         = string<br>      domain_name         = string<br>      domain_sid          = string<br>      domain_guid         = string<br>      forest_name         = string<br>      netbios_domain_name = string<br>    }))<br>  })</pre> | `null` | no |
| <a name="input_file_share_cors_rules"></a> [file\_share\_cors\_rules](#input\_file\_share\_cors\_rules) | CORS rules for the file service. | <pre>list(object({<br>    allowed_headers    = list(string)<br>    allowed_methods    = list(string)<br>    allowed_origins    = list(string)<br>    exposed_headers    = list(string)<br>    max_age_in_seconds = number<br>  }))</pre> | `[]` | no |
| <a name="input_file_share_properties_smb"></a> [file\_share\_properties\_smb](#input\_file\_share\_properties\_smb) | SMB settings for file share. | <pre>object({<br>    authentication_types            = list(string)<br>    channel_encryption_type         = string<br>    kerberos_ticket_encryption_type = string<br>    versions                        = list(string)<br>    multichannel_enabled            = bool<br>  })</pre> | `null` | no |
| <a name="input_file_share_retention_policy_in_days"></a> [file\_share\_retention\_policy\_in\_days](#input\_file\_share\_retention\_policy\_in\_days) | Number of days to retain deleted files. | `number` | `null` | no |
| <a name="input_hns_enabled"></a> [hns\_enabled](#input\_hns\_enabled) | Enable or disable Hierarchical Namespace (Data Lake Gen2). | `bool` | `false` | no |
| <a name="input_https_traffic_only_enabled"></a> [https\_traffic\_only\_enabled](#input\_https\_traffic\_only\_enabled) | Enable or disable HTTPS traffic only. | `bool` | `true` | no |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | A list of user-assigned identity IDs. | `list(string)` | `[]` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | The type of managed identity to use (SystemAssigned, UserAssigned, etc). | `string` | `null` | no |
| <a name="input_infrastructure_encryption_enabled"></a> [infrastructure\_encryption\_enabled](#input\_infrastructure\_encryption\_enabled) | Enable infrastructure encryption for the storage account. | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure location where the storage account will be created. | `string` | n/a | yes |
| <a name="input_min_tls_version"></a> [min\_tls\_version](#input\_min\_tls\_version) | The minimum TLS version to be permitted on requests to storage. | `string` | `"TLS1_2"` | no |
| <a name="input_network_bypass"></a> [network\_bypass](#input\_network\_bypass) | A list of services to bypass network rules for. | `list(string)` | `[]` | no |
| <a name="input_nfsv3_enabled"></a> [nfsv3\_enabled](#input\_nfsv3\_enabled) | Enable or disable NFSv3 protocol. | `bool` | `false` | no |
| <a name="input_private_link_access"></a> [private\_link\_access](#input\_private\_link\_access) | Private link access rules. | <pre>list(object({<br>    endpoint_resource_id = string<br>    endpoint_tenant_id   = string<br>  }))</pre> | `[]` | no |
| <a name="input_public_nested_items_allowed"></a> [public\_nested\_items\_allowed](#input\_public\_nested\_items\_allowed) | Allow or disallow public access to all blobs or containers. | `bool` | `false` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Enable or disable public network access. | `bool` | `true` | no |
| <a name="input_queue_properties_logging"></a> [queue\_properties\_logging](#input\_queue\_properties\_logging) | Logging properties for the queue service. | <pre>object({<br>    delete                = bool<br>    read                  = bool<br>    write                 = bool<br>    version               = string<br>    retention_policy_days = number<br>  })</pre> | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the storage account. | `string` | n/a | yes |
| <a name="input_sftp_enabled"></a> [sftp\_enabled](#input\_sftp\_enabled) | Enable or disable SFTP. | `bool` | `false` | no |
| <a name="input_shared_access_key_enabled"></a> [shared\_access\_key\_enabled](#input\_shared\_access\_key\_enabled) | Enable or disable shared access key authorization. | `bool` | `true` | no |
| <a name="input_static_website_config"></a> [static\_website\_config](#input\_static\_website\_config) | Configuration for static website hosting. | <pre>object({<br>    index_document     = string<br>    error_404_document = string<br>  })</pre> | `null` | no |
| <a name="input_storage_name"></a> [storage\_name](#input\_storage\_name) | The name of the  storage account. | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of subnet IDs for virtual network access. | `list(string)` | `[]` | no |
| <a name="input_use_subdomain"></a> [use\_subdomain](#input\_use\_subdomain) | Whether to use indirect CNAME validation. | `bool` | `false` | no |  
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | The ID of the storage account. |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | The name of the storage account. |
| <a name="output_storage_account_primary_access_key"></a> [storage\_account\_primary\_access\_key](#output\_storage\_account\_primary\_access\_key) | The primary access key for the storage account. |
| <a name="output_storage_account_primary_blob_endpoint"></a> [storage\_account\_primary\_blob\_endpoint](#output\_storage\_account\_primary\_blob\_endpoint) | The primary blob endpoint. |
| <a name="output_storage_account_primary_connection_string"></a> [storage\_account\_primary\_connection\_string](#output\_storage\_account\_primary\_connection\_string) | The primary connection string for the storage account. |
| <a name="output_storage_account_primary_web_endpoint"></a> [storage\_account\_primary\_web\_endpoint](#output\_storage\_account\_primary\_web\_endpoint) | The primary web endpoint for static websites (if enabled). |
| <a name="output_storage_account_secondary_access_key"></a> [storage\_account\_secondary\_access\_key](#output\_storage\_account\_secondary\_access\_key) | The secondary access key for the storage account. |
<!-- END_TF_DOCS -->

## Usage

```tf
resource_group_name = "my-resource-group"
location            = "eastus"

account_tier             = "Standard"
account_kind             = "StorageV2"
account_replication_type = "LRS"
access_tier              = "Hot"

min_tls_version                 = "TLS1_2"
public_nested_items_allowed     = false
public_network_access_enabled   = true
shared_access_key_enabled       = true
sftp_enabled                    = false
nfsv3_enabled                   = false
hns_enabled                     = true
https_traffic_only_enabled      = true
cross_tenant_replication_enabled = false
infrastructure_encryption_enabled = true
allowed_copy_scope              = "AAD"

identity_type = "SystemAssigned"
identity_ids  = []

static_website_config = {
  index_document     = "index.html"
  error_404_document = "404.html"
}

custom_domain_name = "www.example.com"
use_subdomain      = false

customer_managed_key = {
  key_vault_key_id          = ""
  managed_hsm_key_id        = ""
  user_assigned_identity_id = ""
}

blob_data_protection = {
  change_feed_enabled                       = true
  change_feed_retention_in_days             = 7
  versioning_enabled                        = true
  last_access_time_enabled                  = true
  delete_retention_policy_in_days           = 10
  container_delete_retention_policy_in_days = 14
}

blob_cors_rules = [
  {
    allowed_headers    = ["*"]
    allowed_methods    = ["GET", "POST"]
    allowed_origins    = ["*"]
    exposed_headers    = ["*"]
    max_age_in_seconds = 3600
  }
]

queue_properties_logging = {
  delete                = true
  read                  = true
  write                 = true
  version               = "1.0"
  retention_policy_days = 7
}

file_share_cors_rules = [
  {
    allowed_headers    = ["*"]
    allowed_methods    = ["GET", "POST"]
    allowed_origins    = ["https://example.com"]
    exposed_headers    = ["*"]
    max_age_in_seconds = 3600
  }
]

file_share_retention_policy_in_days = 7

file_share_properties_smb = {
  authentication_types            = ["NTLMv2"]
  channel_encryption_type         = "AES-256"
  kerberos_ticket_encryption_type = "RC4-HMAC"
  versions                        = ["SMB3.1.1"]
  multichannel_enabled            = true
}

file_share_authentication = {
  directory_type = "AD"
  active_directory = {
    storage_sid         = "S-1-5-21-..."
    domain_name         = "example.com"
    domain_sid          = "S-1-5-21-..."
    domain_guid         = "abcd1234-abcd-1234-abcd-1234abcd5678"
    forest_name         = "example.com"
    netbios_domain_name = "EXAMPLE"
  }
}

network_bypass = ["AzureServices"]

subnet_ids = [
  "/subscriptions/xxx/resourceGroups/xxx/providers/Microsoft.Network/virtualNetworks/xxx/subnets/default"
]

private_link_access = [
  {
    endpoint_resource_id = "/subscriptions/xxx/resourceGroups/xxx/providers/Microsoft.Storage/storageAccounts/other"
    endpoint_tenant_id   = "00000000-0000-0000-0000-000000000000"
  }
]

extra_tags = {
  environment = "dev"
  team        = "storage"
}

```
