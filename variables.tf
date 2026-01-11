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
    enabled             = optional(bool, true)
    tags                = optional(map(string))
    action = object({
      connection_string = optional(string)
      resource_id       = string
      trigger_url       = optional(string)
      type              = optional(string)
    })
    source = object({
      event_source = string
      rule_set = optional(object({
        rule = object({
          expected_value = string
          operator       = string
          property_path  = string
          property_type  = string
        })
      }))
    })
  }))
}

