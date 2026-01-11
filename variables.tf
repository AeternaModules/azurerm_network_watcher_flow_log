variable "network_watcher_flow_logs" {
  description = <<EOT
Map of network_watcher_flow_logs, attributes below
Required:
    - enabled
    - name
    - network_watcher_name
    - resource_group_name
    - storage_account_id
    - retention_policy (block):
        - days (required)
        - enabled (required)
Optional:
    - location
    - network_security_group_id
    - tags
    - target_resource_id
    - version
    - traffic_analytics (block):
        - enabled (required)
        - interval_in_minutes (optional)
        - workspace_id (required)
        - workspace_region (required)
        - workspace_resource_id (required)
EOT

  type = map(object({
    enabled                   = bool
    name                      = string
    network_watcher_name      = string
    resource_group_name       = string
    storage_account_id        = string
    location                  = optional(string)
    network_security_group_id = optional(string)
    tags                      = optional(map(string))
    target_resource_id        = optional(string)
    version                   = optional(number, 1)
    retention_policy = object({
      days    = number
      enabled = bool
    })
    traffic_analytics = optional(object({
      enabled               = bool
      interval_in_minutes   = optional(number, 60)
      workspace_id          = string
      workspace_region      = string
      workspace_resource_id = string
    }))
  }))
}

