output "network_watcher_flow_logs" {
  description = "All network_watcher_flow_log resources"
  value       = azurerm_network_watcher_flow_log.network_watcher_flow_logs
}
output "network_watcher_flow_logs_enabled" {
  description = "List of enabled values across all network_watcher_flow_logs"
  value       = [for k, v in azurerm_network_watcher_flow_log.network_watcher_flow_logs : v.enabled]
}
output "network_watcher_flow_logs_location" {
  description = "List of location values across all network_watcher_flow_logs"
  value       = [for k, v in azurerm_network_watcher_flow_log.network_watcher_flow_logs : v.location]
}
output "network_watcher_flow_logs_name" {
  description = "List of name values across all network_watcher_flow_logs"
  value       = [for k, v in azurerm_network_watcher_flow_log.network_watcher_flow_logs : v.name]
}
output "network_watcher_flow_logs_network_security_group_id" {
  description = "List of network_security_group_id values across all network_watcher_flow_logs"
  value       = [for k, v in azurerm_network_watcher_flow_log.network_watcher_flow_logs : v.network_security_group_id]
}
output "network_watcher_flow_logs_network_watcher_name" {
  description = "List of network_watcher_name values across all network_watcher_flow_logs"
  value       = [for k, v in azurerm_network_watcher_flow_log.network_watcher_flow_logs : v.network_watcher_name]
}
output "network_watcher_flow_logs_resource_group_name" {
  description = "List of resource_group_name values across all network_watcher_flow_logs"
  value       = [for k, v in azurerm_network_watcher_flow_log.network_watcher_flow_logs : v.resource_group_name]
}
output "network_watcher_flow_logs_retention_policy" {
  description = "List of retention_policy values across all network_watcher_flow_logs"
  value       = [for k, v in azurerm_network_watcher_flow_log.network_watcher_flow_logs : v.retention_policy]
}
output "network_watcher_flow_logs_storage_account_id" {
  description = "List of storage_account_id values across all network_watcher_flow_logs"
  value       = [for k, v in azurerm_network_watcher_flow_log.network_watcher_flow_logs : v.storage_account_id]
}
output "network_watcher_flow_logs_tags" {
  description = "List of tags values across all network_watcher_flow_logs"
  value       = [for k, v in azurerm_network_watcher_flow_log.network_watcher_flow_logs : v.tags]
}
output "network_watcher_flow_logs_target_resource_id" {
  description = "List of target_resource_id values across all network_watcher_flow_logs"
  value       = [for k, v in azurerm_network_watcher_flow_log.network_watcher_flow_logs : v.target_resource_id]
}
output "network_watcher_flow_logs_traffic_analytics" {
  description = "List of traffic_analytics values across all network_watcher_flow_logs"
  value       = [for k, v in azurerm_network_watcher_flow_log.network_watcher_flow_logs : v.traffic_analytics]
}
output "network_watcher_flow_logs_version" {
  description = "List of version values across all network_watcher_flow_logs"
  value       = [for k, v in azurerm_network_watcher_flow_log.network_watcher_flow_logs : v.version]
}

