module "template" {
  source = "../.."

  name                       = "example-cogacct"
  resource_group_name        = "example-rg"
  location                   = "Sweden Central"
  kind                       = "AIServices"
  sku_name                   = "S0"
  custom_subdomain_name      = "examplecogacctsubdomain"
  project_management_enabled = true
  identity_type              = "SystemAssigned"
  tags                       = { environment = "test" }

  projects = [{
    name         = "example-project"
    display_name = "Example AI Project"
    identity = {
      type = "SystemAssigned"
    }
  }]

  rai_blocklists = [{
    name        = "example-blocklist"
    description = "Example blocklist for harmful content"
  }]

  rai_policies = [{
    name             = "example-rai-policy"
    base_policy_name = "Microsoft.Default"
    mode             = "Default"
    content_filters = [
      {
        name               = "hate"
        filter_enabled     = true
        block_enabled      = true
        severity_threshold = "Medium"
        source             = "Prompt"
      },
      {
        name               = "violence"
        filter_enabled     = true
        block_enabled      = true
        severity_threshold = "Medium"
        source             = "Completion"
      }
    ]
  }]
}
