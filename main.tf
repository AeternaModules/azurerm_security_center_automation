resource "azurerm_security_center_automation" "security_center_automations" {
  for_each = var.security_center_automations

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  scopes              = each.value.scopes
  description         = each.value.description
  enabled             = each.value.enabled
  tags                = each.value.tags

  action {
    connection_string = each.value.action.connection_string
    resource_id       = each.value.action.resource_id
    trigger_url       = each.value.action.trigger_url
    type              = each.value.action.type
  }

  source {
    event_source = each.value.source.event_source
    dynamic "rule_set" {
      for_each = each.value.source.rule_set != null ? [each.value.source.rule_set] : []
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

