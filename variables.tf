variable "network_watcher_flow_logs" {
  description = <<EOT
Map of network_watcher_flow_logs, attributes below
Required:
    - enabled
    - name
    - network_watcher_name
    - resource_group_name
    - storage_account_id
    - target_resource_id
    - retention_policy (block):
        - days (required)
        - enabled (required)
Optional:
    - location
    - tags
    - version
    - traffic_analytics (block):
        - enabled (required)
        - interval_in_minutes (optional)
        - workspace_id (required)
        - workspace_region (required)
        - workspace_resource_id (required)
EOT

  type = map(object({
    enabled              = bool
    name                 = string
    network_watcher_name = string
    resource_group_name  = string
    storage_account_id   = string
    target_resource_id   = string
    location             = optional(string)
    tags                 = optional(map(string))
    version              = optional(number)
    retention_policy = object({
      days    = number
      enabled = bool
    })
    traffic_analytics = optional(object({
      enabled               = bool
      interval_in_minutes   = optional(number)
      workspace_id          = string
      workspace_region      = string
      workspace_resource_id = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.network_watcher_flow_logs : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.network_watcher_flow_logs : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.network_watcher_flow_logs : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.network_watcher_flow_logs : (
        v.traffic_analytics == null || (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.traffic_analytics.workspace_id)))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.network_watcher_flow_logs : (
        v.traffic_analytics == null || (v.traffic_analytics.interval_in_minutes == null || (contains([10, 60], v.traffic_analytics.interval_in_minutes)))
      )
    ])
    error_message = "must be one of: 10, 60"
  }
  validation {
    condition = alltrue([
      for k, v in var.network_watcher_flow_logs : (
        v.version == null || (v.version >= 1 && v.version <= 2)
      )
    ])
    error_message = "must be between 1 and 2"
  }
  validation {
    condition = alltrue([
      for k, v in var.network_watcher_flow_logs : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 11 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

