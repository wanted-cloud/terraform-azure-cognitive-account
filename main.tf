/*
 * # wanted-cloud/terraform-azure-cognitive-account
 * 
 * Terraform building block managing Azure Cognitive Service account and related resources.
 */

resource "azurerm_cognitive_account" "this" {
  name                                         = var.name
  location                                     = var.location != "" ? var.location : data.azurerm_resource_group.this.location
  resource_group_name                          = data.azurerm_resource_group.this.name
  kind                                         = var.kind
  sku_name                                     = var.sku_name
  custom_subdomain_name                        = var.custom_subdomain_name != "" ? var.custom_subdomain_name : null
  dynamic_throttling_enabled                   = var.dynamic_throttling_enabled
  fqdns                                        = var.fqdns
  local_auth_enabled                           = var.local_auth_enabled
  metrics_advisor_aad_client_id                = var.metrics_advisor_aad_client_id != "" ? var.metrics_advisor_aad_client_id : null
  metrics_advisor_aad_tenant_id                = var.metrics_advisor_aad_tenant_id != "" ? var.metrics_advisor_aad_tenant_id : null
  metrics_advisor_super_user_name              = var.metrics_advisor_super_user_name != "" ? var.metrics_advisor_super_user_name : null
  metrics_advisor_website_name                 = var.metrics_advisor_website_name != "" ? var.metrics_advisor_website_name : null
  outbound_network_access_restricted           = var.outbound_network_access_restricted
  public_network_access_enabled                = var.public_network_access_enabled
  qna_runtime_endpoint                         = var.qna_runtime_endpoint != "" ? var.qna_runtime_endpoint : null
  custom_question_answering_search_service_id  = var.custom_question_answering_search_service_id != "" ? var.custom_question_answering_search_service_id : null
  custom_question_answering_search_service_key = var.custom_question_answering_search_service_key != "" ? var.custom_question_answering_search_service_key : null

  tags = merge(local.metadata.tags, var.tags)

  dynamic "network_acls" {
    for_each = var.network_rules_default_action != "" ? [1] : []

    content {
      default_action = var.network_rules_default_action
      ip_rules       = var.network_rules_ip_rules

      dynamic "virtual_network_rules" {
        for_each = var.network_rules_virtual_network_rules
        content {
          subnet_id                            = virtual_network_rules.value.subnet_id
          ignore_missing_vnet_service_endpoint = virtual_network_rules.value.ignore_missing_vnet_service_endpoint
        }

      }
    }

  }

  dynamic "identity" {
    for_each = var.identity_type != "" ? [var.identity_type] : []
    content {
      type         = identity.value
      identity_ids = var.user_assigned_identity_ids
    }
  }
}