resource "azurerm_cognitive_deployment" "this" {
  for_each = { for deployment in var.deployments : deployment.name => deployment }

  name                 = each.value.name
  cognitive_account_id = azurerm_cognitive_account.this.id

  dynamic_throttling_enabled = var.dynamic_throttling_enabled
  rai_policy_name            = each.value.rai_policy_name
  version_upgrade_option     = each.value.version_upgrade_option


  model {
    format  = each.value.model.format
    name    = each.value.model.name
    version = each.value.model.version
  }

  sku {
    name     = each.value.sku.name
    tier     = each.value.sku.tier
    size     = each.value.sku.size
    family   = each.value.sku.family
    capacity = each.value.sku.capacity
  }
}