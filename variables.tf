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
        - type (required)
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
    enabled             = optional(bool)
    tags                = optional(map(string))
    action = list(object({
      connection_string = optional(string)
      resource_id       = string
      trigger_url       = optional(string)
      type              = string
    }))
    source = list(object({
      event_source = string
      rule_set = optional(list(object({
        rule = list(object({
          expected_value = string
          operator       = string
          property_path  = string
          property_type  = string
        }))
      })))
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
        alltrue([for item in v.source : (item.rule_set == null || alltrue([for item in item.rule_set : (length(item.rule) >= 1)]))])
      )
    ])
    error_message = "Each rule list must contain at least 1 items"
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
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.security_center_automations : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.security_center_automations : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.security_center_automations : (
        v.description == null || (length(v.description) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.security_center_automations : (
        alltrue([for item in v.action : (item.connection_string == null || (length(item.connection_string) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.security_center_automations : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 13 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

