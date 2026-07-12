output "security_center_automations_id" {
  description = "Map of id values across all security_center_automations, keyed the same as var.security_center_automations"
  value       = { for k, v in azurerm_security_center_automation.security_center_automations : k => v.id }
}
output "security_center_automations_action" {
  description = "Map of action values across all security_center_automations, keyed the same as var.security_center_automations"
  value       = { for k, v in azurerm_security_center_automation.security_center_automations : k => v.action }
  sensitive   = true
}
output "security_center_automations_description" {
  description = "Map of description values across all security_center_automations, keyed the same as var.security_center_automations"
  value       = { for k, v in azurerm_security_center_automation.security_center_automations : k => v.description }
}
output "security_center_automations_enabled" {
  description = "Map of enabled values across all security_center_automations, keyed the same as var.security_center_automations"
  value       = { for k, v in azurerm_security_center_automation.security_center_automations : k => v.enabled }
}
output "security_center_automations_location" {
  description = "Map of location values across all security_center_automations, keyed the same as var.security_center_automations"
  value       = { for k, v in azurerm_security_center_automation.security_center_automations : k => v.location }
}
output "security_center_automations_name" {
  description = "Map of name values across all security_center_automations, keyed the same as var.security_center_automations"
  value       = { for k, v in azurerm_security_center_automation.security_center_automations : k => v.name }
}
output "security_center_automations_resource_group_name" {
  description = "Map of resource_group_name values across all security_center_automations, keyed the same as var.security_center_automations"
  value       = { for k, v in azurerm_security_center_automation.security_center_automations : k => v.resource_group_name }
}
output "security_center_automations_scopes" {
  description = "Map of scopes values across all security_center_automations, keyed the same as var.security_center_automations"
  value       = { for k, v in azurerm_security_center_automation.security_center_automations : k => v.scopes }
}
output "security_center_automations_source" {
  description = "Map of source values across all security_center_automations, keyed the same as var.security_center_automations"
  value       = { for k, v in azurerm_security_center_automation.security_center_automations : k => v.source }
}
output "security_center_automations_tags" {
  description = "Map of tags values across all security_center_automations, keyed the same as var.security_center_automations"
  value       = { for k, v in azurerm_security_center_automation.security_center_automations : k => v.tags }
}

