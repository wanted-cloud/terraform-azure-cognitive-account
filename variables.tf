variable "name" {
  description = "Name of the Cognitive account resource."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group in which the Cognitive account will be created."
  type        = string
}

variable "location" {
  description = "Location of the resource group in which the Cognitive account will be created, if not set it will be the same as the resource group."
  type        = string
  default     = ""
}

variable "kind" {
  description = "The kind of Cognitive account to create."
  type        = string
  default     = "Face"

}

variable "sku_name" {
  description = "The SKU name of the Cognitive account."
  type        = string
  default     = "S0"
}

variable "tags" {
  description = "Tags to be applied to the Cognitive account resources."
  type        = map(string)
  default     = {}
}

variable "custom_subdomain_name" {
  description = "Custom subdomain name for the Cognitive account."
  type        = string
  default     = ""
}

variable "dynamic_throttling_enabled" {
  description = "Enable dynamic throttling for the Cognitive account."
  type        = bool
  default     = false

}

variable "fqdns" {
  description = "Fully qualified domain names allowed to access the Cognitive account."
  type        = list(string)
  default     = []

}

variable "local_auth_enabled" {
  description = "Enable local authentication for the Cognitive account."
  type        = bool
  default     = false

}

variable "metrics_advisor_aad_client_id" {
  description = "Client ID for Azure Active Directory authentication for Metrics Advisor. This attribute is only set when kind is MetricsAdvisor"
  type        = string
  default     = ""
}

variable "metrics_advisor_aad_tenant_id" {
  description = "Tenant ID for Azure Active Directory authentication for Metrics Advisor. This attribute is only set when kind is MetricsAdvisor"
  type        = string
  default     = ""
}

variable "metrics_advisor_super_user_name" {
  description = "Super user name for Metrics Advisor. This attribute is only set when kind is MetricsAdvisor"
  type        = string
  default     = ""
}

variable "metrics_advisor_website_name" {
  description = "Website name for Metrics Advisor. This attribute is only set when kind is MetricsAdvisor"
  type        = string
  default     = ""
}

variable "outbound_network_access_restricted" {
  description = "Restrict outbound network access for the Cognitive account. This attribute is only set when kind is MetricsAdvisor"
  type        = bool
  default     = false

}

variable "public_network_access_enabled" {
  description = "Enable public network access for the Cognitive account. This attribute is only set when kind is MetricsAdvisor"
  type        = bool
  default     = true

}

variable "qna_runtime_endpoint" {
  description = "QnA runtime endpoint for the Cognitive account."
  type        = string
  default     = ""
}

variable "custom_question_answering_search_service_id" {
  description = "Search service ID for custom question answering. This attribute is only set when kind is TextAnalytics"
  type        = string
  default     = ""
}

variable "custom_question_answering_search_service_key" {
  description = "Search service key for custom question answering. This attribute is only set when kind is TextAnalytics"
  type        = string
  default     = ""

}

variable "identity_type" {
  description = "Type of identity to use for the Azure service plan."
  type        = string
  default     = ""
}

variable "user_assigned_identity_ids" {
  description = "List of user assigned identity IDs for the Azure service plan."
  type        = list(string)
  default     = ""
}

variable "network_rules_bypass_option" {
  description = "Network rule bypass option for the Azure service plan."
  type        = string
  default     = "None"

}

variable "network_rules_default_action" {
  description = "Network rule bypass option for the Cognitive account."
  type        = string
  default     = "None"
}

variable "network_rules_ip_rules" {
  description = "List of IP rules for the Cognitive account."
  type        = list(string)
  default     = []
}

variable "network_rules_virtual_network_rules" {
  description = "List of virtual network subscriptions for the Cognitive account."
  type = list(object({
    subnet_id                            = string
    ignore_missing_vnet_service_endpoint = optional(bool, false)
  }))
  default = []
}

variable "deployments" {
  description = "List of deployments configuration to create for the Cognitive account."
  type = list(object({
    name                       = string
    cognitive_account_id       = string
    dynamic_throttling_enabled = optional(bool, false)
    rai_policy_name            = optional(string, null)
    version_upgrade_option     = optional(string, "OnceNewDefaultVersionAvailable")
    model = object({
      name    = string
      format  = string
      version = optional(string, null)
    })
    sku = object({
      name     = string
      tier     = optional(string, null)
      size     = optional(string, null)
      family   = optional(string, null)
      capacity = optional(string, null)
    })
  }))
  default = []

}
