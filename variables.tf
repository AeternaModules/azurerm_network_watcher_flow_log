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
    version                   = optional(number)
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
  # --- Unconfirmed validation candidates, derived from azurerm_network_watcher_flow_log's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: network_watcher_name
  #   source:    validation.NoZeroValues(...) - no translation rule yet, add one
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: name
  #   source:    [from validate.NetworkWatcherFlowLogName] !regexp.MustCompile(`^[^\W_]$|^[^\W_][\w.\-]{0,78}[\w]$`).MatchString(value)
  # path: target_resource_id
  #   source:    validation.Any(...) - no translation rule yet, add one
  # path: storage_account_id
  #   source:    [from commonids.ValidateStorageAccountID] !ok
  # path: storage_account_id
  #   source:    [from commonids.ValidateStorageAccountID] err != nil
  # path: traffic_analytics.workspace_id
  #   condition: can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", value))
  #   message:   must be a valid UUID
  # path: traffic_analytics.workspace_resource_id
  #   source:    [from azure.ValidateResourceIDOrEmpty] !ok
  # path: traffic_analytics.interval_in_minutes
  #   source:    validation.IntInSlice(...) - no translation rule yet, add one
  # path: version
  #   condition: value >= 1 && value <= 2
  #   message:   must be between 1 and 2
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

