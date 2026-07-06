variable "security_center_automations" {
  description = <<EOT
Map of security_center_automations, attributes below
Required:
    - location
    - name
    - resource_group_name
    - scopes
    - action (block):
        - connection_string (optional)
        - resource_id (required)
        - trigger_url (optional)
        - type (optional)
    - source (block):
        - event_source (required)
        - rule_set (optional, block):
            - rule (required, block):
                - expected_value (required)
                - operator (required)
                - property_path (required)
                - property_type (required)
Optional:
    - description
    - enabled
    - tags
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    scopes              = list(string)
    description         = optional(string)
    enabled             = optional(bool) # Default: true
    tags                = optional(map(string))
    action = list(object({
      connection_string = optional(string)
      resource_id       = string
      trigger_url       = optional(string)
      type              = optional(string)
    }))
    source = list(object({
      event_source = string
      rule_set = optional(object({
        rule = object({
          expected_value = string
          operator       = string
          property_path  = string
          property_type  = string
        })
      }))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.security_center_automations : (
        length(v.action) >= 1
      )
    ])
    error_message = "Each action list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.security_center_automations : (
        length(v.source) >= 1
      )
    ])
    error_message = "Each source list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.security_center_automations : (
        length(v.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.security_center_automations : (
        v.description == null || (length(v.description) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_security_center_automation's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
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
  # path: scopes[*]
  #   source:    [from commonids.ValidateScopeID] !ok
  # path: scopes[*]
  #   source:    [from commonids.ValidateScopeID] err != nil
  # path: action.type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: action.resource_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: action.resource_id
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: action.trigger_url
  #   source:    validation.IsURLWithHTTPorHTTPS(...) - no translation rule yet, add one
  # path: action.connection_string
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: source.event_source
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: source.rule_set.rule.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: source.rule_set.rule.property_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
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

