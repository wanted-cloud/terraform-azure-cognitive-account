module "template" {
    source = "../.."

    name                = "example-cogacct"
    resource_group_name = "example-rg"
    location            = "Sweden Central"
    kind                = "OpenAI"
    sku_name            = "S0"
    custom_subdomain_name = "examplecogacctsubdomain"
    tags                = { environment = "test" }

    deployments = [{
      name = "example-deployment-embedding"
      model = {
        name    = "text-embedding-ada-002"
        format  = "OpenAI"
        version = "2"
      }
      sku = {
        name = "Standard"
      }
    }, {
      name = "example-deployment-gpt-4o-mini"
      model = {
        name    = "gpt-4o-mini"
        format  = "OpenAI"
        version = "2024-07-18"
      }
      sku = {
        name = "Standard"
      }
    }]
}