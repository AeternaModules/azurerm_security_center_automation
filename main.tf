resource "azurerm_security_center_automation" "security_center_automations" {
  for_each = var.security_center_automations

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  scopes              = each.value.scopes
  description         = each.value.description
  enabled             = each.value.enabled
  tags                = each.value.tags

  dynamic "action" {
    for_each = each.value.action
    content {
      connection_string = action.value.connection_string
      resource_id       = action.value.resource_id
      trigger_url       = action.value.trigger_url
      type              = action.value.type
    }
  }

  dynamic "source" {
    for_each = each.value.source
    content {
      event_source = source.value.event_source
      dynamic "rule_set" {
        for_each = source.value.rule_set != null ? [source.value.rule_set] : []
        content {
          rule {
            expected_value = rule_set.value.rule.expected_value
            operator       = rule_set.value.rule.operator
            property_path  = rule_set.value.rule.property_path
            property_type  = rule_set.value.rule.property_type
          }
        }
      }
    }
  }
}

