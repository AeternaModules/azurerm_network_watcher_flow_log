output "network_watcher_flow_logs_id" {
  description = "Map of id values across all network_watcher_flow_logs, keyed the same as var.network_watcher_flow_logs"
  value       = { for k, v in azurerm_network_watcher_flow_log.network_watcher_flow_logs : k => v.id }
}
output "network_watcher_flow_logs_enabled" {
  description = "Map of enabled values across all network_watcher_flow_logs, keyed the same as var.network_watcher_flow_logs"
  value       = { for k, v in azurerm_network_watcher_flow_log.network_watcher_flow_logs : k => v.enabled }
}
output "network_watcher_flow_logs_location" {
  description = "Map of location values across all network_watcher_flow_logs, keyed the same as var.network_watcher_flow_logs"
  value       = { for k, v in azurerm_network_watcher_flow_log.network_watcher_flow_logs : k => v.location }
}
output "network_watcher_flow_logs_name" {
  description = "Map of name values across all network_watcher_flow_logs, keyed the same as var.network_watcher_flow_logs"
  value       = { for k, v in azurerm_network_watcher_flow_log.network_watcher_flow_logs : k => v.name }
}
output "network_watcher_flow_logs_network_security_group_id" {
  description = "Map of network_security_group_id values across all network_watcher_flow_logs, keyed the same as var.network_watcher_flow_logs"
  value       = { for k, v in azurerm_network_watcher_flow_log.network_watcher_flow_logs : k => v.network_security_group_id }
}
output "network_watcher_flow_logs_network_watcher_name" {
  description = "Map of network_watcher_name values across all network_watcher_flow_logs, keyed the same as var.network_watcher_flow_logs"
  value       = { for k, v in azurerm_network_watcher_flow_log.network_watcher_flow_logs : k => v.network_watcher_name }
}
output "network_watcher_flow_logs_resource_group_name" {
  description = "Map of resource_group_name values across all network_watcher_flow_logs, keyed the same as var.network_watcher_flow_logs"
  value       = { for k, v in azurerm_network_watcher_flow_log.network_watcher_flow_logs : k => v.resource_group_name }
}
output "network_watcher_flow_logs_retention_policy" {
  description = "Map of retention_policy values across all network_watcher_flow_logs, keyed the same as var.network_watcher_flow_logs"
  value       = { for k, v in azurerm_network_watcher_flow_log.network_watcher_flow_logs : k => v.retention_policy }
}
output "network_watcher_flow_logs_storage_account_id" {
  description = "Map of storage_account_id values across all network_watcher_flow_logs, keyed the same as var.network_watcher_flow_logs"
  value       = { for k, v in azurerm_network_watcher_flow_log.network_watcher_flow_logs : k => v.storage_account_id }
}
output "network_watcher_flow_logs_tags" {
  description = "Map of tags values across all network_watcher_flow_logs, keyed the same as var.network_watcher_flow_logs"
  value       = { for k, v in azurerm_network_watcher_flow_log.network_watcher_flow_logs : k => v.tags }
}
output "network_watcher_flow_logs_target_resource_id" {
  description = "Map of target_resource_id values across all network_watcher_flow_logs, keyed the same as var.network_watcher_flow_logs"
  value       = { for k, v in azurerm_network_watcher_flow_log.network_watcher_flow_logs : k => v.target_resource_id }
}
output "network_watcher_flow_logs_traffic_analytics" {
  description = "Map of traffic_analytics values across all network_watcher_flow_logs, keyed the same as var.network_watcher_flow_logs"
  value       = { for k, v in azurerm_network_watcher_flow_log.network_watcher_flow_logs : k => v.traffic_analytics }
}
output "network_watcher_flow_logs_version" {
  description = "Map of version values across all network_watcher_flow_logs, keyed the same as var.network_watcher_flow_logs"
  value       = { for k, v in azurerm_network_watcher_flow_log.network_watcher_flow_logs : k => v.version }
}

