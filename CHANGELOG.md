# Changelog

All notable changes to this module will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this module adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Breaking Changes

- `outputs.tf`: Output `congnitive_account` has been renamed to `cognitive_account` (typo correction). Any caller referencing `module.<name>.congnitive_account` must be updated to `module.<name>.cognitive_account`.
- `outputs.tf`: Output `congnitive_account_deployments` has been renamed to `cognitive_account_deployments` (typo correction). Any caller referencing `module.<name>.congnitive_account_deployments` must be updated to `module.<name>.cognitive_account_deployments`.

### Features

- `main.tf`, `variables.tf`: Added `project_management_enabled` variable (`bool`, default `false`) wired into the `azurerm_cognitive_account` resource, enabling Azure AI Foundry project management on the account.
- `project.tf`, `variables.tf`: Added `projects` variable and `azurerm_cognitive_account_project` resource to manage Azure AI Foundry projects associated with the Cognitive account.
- `rai-blocklist.tf`, `variables.tf`: Added `rai_blocklists` variable and `azurerm_cognitive_account_rai_blocklist` resource for managing Responsible AI blocklists on the Cognitive account.
- `rai-policy.tf`, `variables.tf`: Added `rai_policies` variable and `azurerm_cognitive_account_rai_policy` resource with dynamic `content_filter` blocks for managing Responsible AI content filtering policies.
- `examples/with-rai-policy/`: Added new example demonstrating combined usage of RAI policies, RAI blocklists, and Azure AI Foundry projects.

### Bug Fixes

- `deployment.tf`: Fixed `dynamic_throttling_enabled` incorrectly reading from the account-level `var.dynamic_throttling_enabled` instead of the per-deployment `each.value.dynamic_throttling_enabled`. Each deployment now correctly inherits its own throttling configuration.

### Security

- `outputs.tf`: The `cognitive_account` output (formerly `congnitive_account`) now sets `sensitive = true`, preventing the Cognitive account resource — which contains access keys and endpoints — from being printed in plain text in Terraform plan and apply output.
- `variables.tf`: The `custom_question_answering_search_service_key` variable now sets `sensitive = true`, preventing the search service key from being exposed in logs or plan output.

## [0.1.0-rc.1] - 2025-01-01

### Features

- Initial release candidate of the `terraform-azure-cognitive-account` module.
- Manages `azurerm_cognitive_account` and `azurerm_cognitive_deployment` resources.
- Supports network rules, identity configuration, and per-account dynamic throttling.
- Published to the Terraform Registry as `wanted-cloud/cognitive-account/azure`.

[Unreleased]: https://github.com/wanted-cloud/terraform-azure-cognitive-account/compare/v0.1.0-rc.1...HEAD
[0.1.0-rc.1]: https://github.com/wanted-cloud/terraform-azure-cognitive-account/releases/tag/v0.1.0-rc.1
