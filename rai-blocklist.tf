resource "azurerm_cognitive_account_rai_blocklist" "this" {
  for_each = { for blocklist in var.rai_blocklists : blocklist.name => blocklist }

  name                 = each.value.name
  cognitive_account_id = azurerm_cognitive_account.this.id
  description          = each.value.description

  timeouts {
    create = try(
      local.metadata.resource_timeouts["azurerm_cognitive_account_rai_blocklist"]["create"],
      local.metadata.resource_timeouts["default"]["create"]
    )
    read = try(
      local.metadata.resource_timeouts["azurerm_cognitive_account_rai_blocklist"]["read"],
      local.metadata.resource_timeouts["default"]["read"]
    )
    update = try(
      local.metadata.resource_timeouts["azurerm_cognitive_account_rai_blocklist"]["update"],
      local.metadata.resource_timeouts["default"]["update"]
    )
    delete = try(
      local.metadata.resource_timeouts["azurerm_cognitive_account_rai_blocklist"]["delete"],
      local.metadata.resource_timeouts["default"]["delete"]
    )
  }
}
