<!-- BEGIN_TF_DOCS -->
# wanted-cloud/terraform-azure-cognitive-account

Terraform building block managing Azure Cognitive Service account and related resources.

## Table of contents

- [Requirements](#requirements)
- [Providers](#providers)
- [Variables](#inputs)
- [Outputs](#outputs)
- [Resources](#resources)
- [Usage](#usage)
- [Contributing](#contributing)

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.9)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>=4.60.0)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (4.65.0)

## Required Inputs

The following input variables are required:

### <a name="input_name"></a> [name](#input\_name)

Description: Name of the Cognitive account resource.

Type: `string`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: Name of the resource group in which the Cognitive account will be created.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_custom_question_answering_search_service_id"></a> [custom\_question\_answering\_search\_service\_id](#input\_custom\_question\_answering\_search\_service\_id)

Description: Search service ID for custom question answering. This attribute is only set when kind is TextAnalytics.

Type: `string`

Default: `""`

### <a name="input_custom_question_answering_search_service_key"></a> [custom\_question\_answering\_search\_service\_key](#input\_custom\_question\_answering\_search\_service\_key)

Description: Search service key for custom question answering. This attribute is only set when kind is TextAnalytics.

Type: `string`

Default: `""`

### <a name="input_custom_subdomain_name"></a> [custom\_subdomain\_name](#input\_custom\_subdomain\_name)

Description: Custom subdomain name for the Cognitive account. Defaults to the account name when not set.

Type: `string`

Default: `""`

### <a name="input_deployments"></a> [deployments](#input\_deployments)

Description: List of deployments configuration to create for the Cognitive account.

Type:

```hcl
list(object({
    name = string
    //cognitive_account_id       = string
    dynamic_throttling_enabled = optional(bool, false)
    rai_policy_name            = optional(string, null)
    version_upgrade_option     = optional(string, "OnceNewDefaultVersionAvailable")
    model = object({
      name    = string
      format  = string
      version = optional(string, null)
    })
    sku = optional(object({
      name     = string
      capacity = optional(number, null)
    }), null)
    scale = optional(object({
      type     = string
      capacity = number
    }), null)
  }))
```

Default: `[]`

### <a name="input_dynamic_throttling_enabled"></a> [dynamic\_throttling\_enabled](#input\_dynamic\_throttling\_enabled)

Description: Enable dynamic throttling for the Cognitive account.

Type: `bool`

Default: `false`

### <a name="input_fqdns"></a> [fqdns](#input\_fqdns)

Description: Fully qualified domain names allowed to access the Cognitive account.

Type: `list(string)`

Default: `[]`

### <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type)

Description: Type of identity to use for the Azure service plan.

Type: `string`

Default: `""`

### <a name="input_kind"></a> [kind](#input\_kind)

Description: The kind of Cognitive account to create.

Type: `string`

Default: `"Face"`

### <a name="input_local_auth_enabled"></a> [local\_auth\_enabled](#input\_local\_auth\_enabled)

Description: Enable local authentication for the Cognitive account.

Type: `bool`

Default: `false`

### <a name="input_location"></a> [location](#input\_location)

Description: Location of the resource group in which the Cognitive account will be created, if not set it will be the same as the resource group.

Type: `string`

Default: `""`

### <a name="input_metadata"></a> [metadata](#input\_metadata)

Description: Metadata definitions for the module, this is optional construct allowing override of the module defaults defintions of validation expressions, error messages, resource timeouts and default tags.

Type:

```hcl
object({
    resource_timeouts = optional(
      map(
        object({
          create = optional(string, "30m")
          read   = optional(string, "5m")
          update = optional(string, "30m")
          delete = optional(string, "30m")
        })
      ), {}
    )
    tags                     = optional(map(string), {})
    validator_error_messages = optional(map(string), {})
    validator_expressions    = optional(map(string), {})
  })
```

Default: `{}`

### <a name="input_metrics_advisor_aad_client_id"></a> [metrics\_advisor\_aad\_client\_id](#input\_metrics\_advisor\_aad\_client\_id)

Description: Client ID for Azure Active Directory authentication for Metrics Advisor. This attribute is only set when kind is MetricsAdvisor.

Type: `string`

Default: `""`

### <a name="input_metrics_advisor_aad_tenant_id"></a> [metrics\_advisor\_aad\_tenant\_id](#input\_metrics\_advisor\_aad\_tenant\_id)

Description: Tenant ID for Azure Active Directory authentication for Metrics Advisor. This attribute is only set when kind is MetricsAdvisor.

Type: `string`

Default: `""`

### <a name="input_metrics_advisor_super_user_name"></a> [metrics\_advisor\_super\_user\_name](#input\_metrics\_advisor\_super\_user\_name)

Description: Super user name for Metrics Advisor. This attribute is only set when kind is MetricsAdvisor.

Type: `string`

Default: `""`

### <a name="input_metrics_advisor_website_name"></a> [metrics\_advisor\_website\_name](#input\_metrics\_advisor\_website\_name)

Description: Website name for Metrics Advisor. This attribute is only set when kind is MetricsAdvisor.

Type: `string`

Default: `""`

### <a name="input_network_rules_bypass_option"></a> [network\_rules\_bypass\_option](#input\_network\_rules\_bypass\_option)

Description: Network rule bypass option for the Azure service plan.

Type: `string`

Default: `"None"`

### <a name="input_network_rules_default_action"></a> [network\_rules\_default\_action](#input\_network\_rules\_default\_action)

Description: Network rule bypass option for the Cognitive account.

Type: `string`

Default: `""`

### <a name="input_network_rules_ip_rules"></a> [network\_rules\_ip\_rules](#input\_network\_rules\_ip\_rules)

Description: List of IP rules for the Cognitive account.

Type: `list(string)`

Default: `[]`

### <a name="input_network_rules_virtual_network_rules"></a> [network\_rules\_virtual\_network\_rules](#input\_network\_rules\_virtual\_network\_rules)

Description: List of virtual network subscriptions for the Cognitive account.

Type:

```hcl
list(object({
    subnet_id                            = string
    ignore_missing_vnet_service_endpoint = optional(bool, false)
  }))
```

Default: `[]`

### <a name="input_outbound_network_access_restricted"></a> [outbound\_network\_access\_restricted](#input\_outbound\_network\_access\_restricted)

Description: Restrict outbound network access for the Cognitive account. This attribute is only set when kind is MetricsAdvisor.

Type: `bool`

Default: `false`

### <a name="input_project_management_enabled"></a> [project\_management\_enabled](#input\_project\_management\_enabled)

Description: Enable project management on the Cognitive account. Required when projects is non-empty. Can only be set to true when kind is set to AIServices.

Type: `bool`

Default: `false`

### <a name="input_projects"></a> [projects](#input\_projects)

Description: List of project configurations to create for the Cognitive account. Requires project\_management\_enabled = true, kind = AIServices, a managed identity, and custom\_subdomain\_name.

Type:

```hcl
list(object({
    name         = string
    location     = optional(string, "")
    description  = optional(string, null)
    display_name = optional(string, null)
    tags         = optional(map(string), {})
    identity = object({
      type         = string
      identity_ids = optional(list(string), [])
    })
  }))
```

Default: `[]`

### <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled)

Description: Enable public network access for the Cognitive account. This attribute is only set when kind is MetricsAdvisor.

Type: `bool`

Default: `true`

### <a name="input_qna_runtime_endpoint"></a> [qna\_runtime\_endpoint](#input\_qna\_runtime\_endpoint)

Description: QnA runtime endpoint for the Cognitive account.

Type: `string`

Default: `""`

### <a name="input_rai_blocklists"></a> [rai\_blocklists](#input\_rai\_blocklists)

Description: List of RAI blocklist configurations to create for the Cognitive account.

Type:

```hcl
list(object({
    name        = string
    description = optional(string, null)
    tags        = optional(map(string), {})
  }))
```

Default: `[]`

### <a name="input_rai_policies"></a> [rai\_policies](#input\_rai\_policies)

Description: List of RAI policy configurations to create for the Cognitive account.

Type:

```hcl
list(object({
    name             = string
    base_policy_name = string
    mode             = optional(string, "Default")
    tags             = optional(map(string), {})
    content_filters = optional(list(object({
      name               = string
      filter_enabled     = bool
      block_enabled      = bool
      severity_threshold = string
      source             = string
    })), [])
  }))
```

Default: `[]`

### <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name)

Description: The SKU name of the Cognitive account.

Type: `string`

Default: `"S0"`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: Tags to be applied to the Cognitive account resources.

Type: `map(string)`

Default: `{}`

### <a name="input_user_assigned_identity_ids"></a> [user\_assigned\_identity\_ids](#input\_user\_assigned\_identity\_ids)

Description: List of user assigned identity IDs for the Azure service plan.

Type: `list(string)`

Default: `[]`

## Outputs

The following outputs are exported:

### <a name="output_cognitive_account"></a> [cognitive\_account](#output\_cognitive\_account)

Description: The Cognitive account resource.

### <a name="output_cognitive_account_deployments"></a> [cognitive\_account\_deployments](#output\_cognitive\_account\_deployments)

Description: The Cognitive account deployment resources.

### <a name="output_cognitive_account_projects"></a> [cognitive\_account\_projects](#output\_cognitive\_account\_projects)

Description: The Cognitive account project resources.

### <a name="output_cognitive_account_rai_blocklists"></a> [cognitive\_account\_rai\_blocklists](#output\_cognitive\_account\_rai\_blocklists)

Description: The Cognitive account RAI blocklist resources.

### <a name="output_cognitive_account_rai_policies"></a> [cognitive\_account\_rai\_policies](#output\_cognitive\_account\_rai\_policies)

Description: The Cognitive account RAI policy resources.

## Resources

The following resources are used by this module:

- [azurerm_cognitive_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cognitive_account) (resource)
- [azurerm_cognitive_account_project.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cognitive_account_project) (resource)
- [azurerm_cognitive_account_rai_blocklist.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cognitive_account_rai_blocklist) (resource)
- [azurerm_cognitive_account_rai_policy.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cognitive_account_rai_policy) (resource)
- [azurerm_cognitive_deployment.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cognitive_deployment) (resource)
- [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) (data source)

## Usage

> For more detailed examples navigate to `examples` folder of this repository.

Module was also published via Terraform Registry and can be used as a module from the registry.

```hcl
module "example" {
  source  = "wanted-cloud/cognitive-account/azure"
  version = "x.y.z"
}
```

### Basic usage example

The minimal usage for the module is as follows:

```hcl
module "template" {
  source = "../.."

  name                  = "example-cogacct"
  resource_group_name   = "example-rg"
  location              = "Germany West Central"
  kind                  = "OpenAI"
  sku_name              = "S0"
  custom_subdomain_name = "examplecogacctsubdomain"
  tags                  = { environment = "test" }
}
```
## Contributing

_Contributions are welcomed and must follow [Code of Conduct](https://github.com/wanted-cloud/.github?tab=coc-ov-file) and common [Contributions guidelines](https://github.com/wanted-cloud/.github/blob/main/docs/CONTRIBUTING.md)._

> If you'd like to report security issue please follow [security guidelines](https://github.com/wanted-cloud/.github?tab=security-ov-file).
---
<sup><sub>_2025 &copy; All rights reserved - WANTED.solutions s.r.o._</sub></sup>
<!-- END_TF_DOCS -->