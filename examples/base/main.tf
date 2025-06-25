module "template" {
    source = "../.."

    name                = "example-cogacct"
    resource_group_name = "example-rg"
    location            = "North Europe"
    kind                = "OpenAI"
    sku_name            = "S0"
    custom_subdomain_name = "examplecogacctsubdomain"
    tags                = { environment = "test" }

    #network_rules_bypass_option = "None"
    #network_rules_default_action = "Deny"
    #network_rules_ip_rules = ["1.2.3.4"]
    #network_rules_virtual_network_rules = []
}