resource "azurerm_cognitive_account_rai_policy" "this" {
  for_each = { for policy in var.rai_policies : policy.name => policy }

  name                 = each.value.name
  cognitive_account_id = azurerm_cognitive_account.this.id
  base_policy_name     = each.value.base_policy_name
  mode                 = each.value.mode

  tags = each.value.tags

  dynamic "content_filter" {
    for_each = each.value.content_filters

    content {
      name               = content_filter.value.name
      filter_enabled     = content_filter.value.filter_enabled
      block_enabled      = content_filter.value.block_enabled
      severity_threshold = content_filter.value.severity_threshold
      source             = content_filter.value.source
    }
  }

  timeouts {
    create = try(
      local.metadata.resource_timeouts["azurerm_cognitive_account_rai_policy"]["create"],
      local.metadata.resource_timeouts["default"]["create"]
    )
    read = try(
      local.metadata.resource_timeouts["azurerm_cognitive_account_rai_policy"]["read"],
      local.metadata.resource_timeouts["default"]["read"]
    )
    update = try(
      local.metadata.resource_timeouts["azurerm_cognitive_account_rai_policy"]["update"],
      local.metadata.resource_timeouts["default"]["update"]
    )
    delete = try(
      local.metadata.resource_timeouts["azurerm_cognitive_account_rai_policy"]["delete"],
      local.metadata.resource_timeouts["default"]["delete"]
    )
  }
}
