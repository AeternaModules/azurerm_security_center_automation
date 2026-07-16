output "security_center_automations_id" {
  description = "Map of id values across all security_center_automations, keyed the same as var.security_center_automations"
  value       = { for k, v in azurerm_security_center_automation.security_center_automations : k => v.id if v.id != null && length(v.id) > 0 }
}
output "security_center_automations_action" {
  description = "Map of action values across all security_center_automations, keyed the same as var.security_center_automations"
  value       = { for k, v in azurerm_security_center_automation.security_center_automations : k => v.action if v.action != null && length(v.action) > 0 }
  sensitive   = true
}
output "security_center_automations_description" {
  description = "Map of description values across all security_center_automations, keyed the same as var.security_center_automations"
  value       = { for k, v in azurerm_security_center_automation.security_center_automations : k => v.description if v.description != null && length(v.description) > 0 }
}
output "security_center_automations_enabled" {
  description = "Map of enabled values across all security_center_automations, keyed the same as var.security_center_automations"
  value       = { for k, v in azurerm_security_center_automation.security_center_automations : k => v.enabled if v.enabled != null }
}
output "security_center_automations_location" {
  description = "Map of location values across all security_center_automations, keyed the same as var.security_center_automations"
  value       = { for k, v in azurerm_security_center_automation.security_center_automations : k => v.location if v.location != null && length(v.location) > 0 }
}
output "security_center_automations_name" {
  description = "Map of name values across all security_center_automations, keyed the same as var.security_center_automations"
  value       = { for k, v in azurerm_security_center_automation.security_center_automations : k => v.name if v.name != null && length(v.name) > 0 }
}
output "security_center_automations_resource_group_name" {
  description = "Map of resource_group_name values across all security_center_automations, keyed the same as var.security_center_automations"
  value       = { for k, v in azurerm_security_center_automation.security_center_automations : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "security_center_automations_scopes" {
  description = "Map of scopes values across all security_center_automations, keyed the same as var.security_center_automations"
  value       = { for k, v in azurerm_security_center_automation.security_center_automations : k => v.scopes if v.scopes != null && length(v.scopes) > 0 }
}
output "security_center_automations_source" {
  description = "Map of source values across all security_center_automations, keyed the same as var.security_center_automations"
  value       = { for k, v in azurerm_security_center_automation.security_center_automations : k => v.source if v.source != null && length(v.source) > 0 }
}
output "security_center_automations_tags" {
  description = "Map of tags values across all security_center_automations, keyed the same as var.security_center_automations"
  value       = { for k, v in azurerm_security_center_automation.security_center_automations : k => v.tags if v.tags != null && length(v.tags) > 0 }
}

