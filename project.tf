resource "azurerm_cognitive_account_project" "this" {
  for_each = { for project in var.projects : project.name => project }

  name                 = each.value.name
  cognitive_account_id = azurerm_cognitive_account.this.id
  location             = each.value.location != "" ? each.value.location : azurerm_cognitive_account.this.location

  description  = each.value.description
  display_name = each.value.display_name

  tags = each.value.tags

  identity {
    type         = each.value.identity.type
    identity_ids = each.value.identity.identity_ids
  }

  timeouts {
    create = try(
      local.metadata.resource_timeouts["azurerm_cognitive_account_project"]["create"],
      local.metadata.resource_timeouts["default"]["create"]
    )
    read = try(
      local.metadata.resource_timeouts["azurerm_cognitive_account_project"]["read"],
      local.metadata.resource_timeouts["default"]["read"]
    )
    update = try(
      local.metadata.resource_timeouts["azurerm_cognitive_account_project"]["update"],
      local.metadata.resource_timeouts["default"]["update"]
    )
    delete = try(
      local.metadata.resource_timeouts["azurerm_cognitive_account_project"]["delete"],
      local.metadata.resource_timeouts["default"]["delete"]
    )
  }
}
