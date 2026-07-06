output "security_center_automations" {
  description = "All security_center_automation resources"
  value       = azurerm_security_center_automation.security_center_automations
  sensitive   = true
}
output "security_center_automations_action" {
  description = "List of action values across all security_center_automations"
  value       = [for k, v in azurerm_security_center_automation.security_center_automations : v.action]
  sensitive   = true
}
output "security_center_automations_description" {
  description = "List of description values across all security_center_automations"
  value       = [for k, v in azurerm_security_center_automation.security_center_automations : v.description]
}
output "security_center_automations_enabled" {
  description = "List of enabled values across all security_center_automations"
  value       = [for k, v in azurerm_security_center_automation.security_center_automations : v.enabled]
}
output "security_center_automations_location" {
  description = "List of location values across all security_center_automations"
  value       = [for k, v in azurerm_security_center_automation.security_center_automations : v.location]
}
output "security_center_automations_name" {
  description = "List of name values across all security_center_automations"
  value       = [for k, v in azurerm_security_center_automation.security_center_automations : v.name]
}
output "security_center_automations_resource_group_name" {
  description = "List of resource_group_name values across all security_center_automations"
  value       = [for k, v in azurerm_security_center_automation.security_center_automations : v.resource_group_name]
}
output "security_center_automations_scopes" {
  description = "List of scopes values across all security_center_automations"
  value       = [for k, v in azurerm_security_center_automation.security_center_automations : v.scopes]
}
output "security_center_automations_source" {
  description = "List of source values across all security_center_automations"
  value       = [for k, v in azurerm_security_center_automation.security_center_automations : v.source]
}
output "security_center_automations_tags" {
  description = "List of tags values across all security_center_automations"
  value       = [for k, v in azurerm_security_center_automation.security_center_automations : v.tags]
}

