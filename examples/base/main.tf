module "template" {
    source = "../.."

    name                = "example-cogacct"
    resource_group_name = "example-rg"
    location            = "Germany West Central"
    kind                = "OpenAI"
    sku_name            = "S0"
    custom_subdomain_name = "examplecogacctsubdomain"
    tags                = { environment = "test" }
}