output "cognitive_account" {
  description = "The Cognitive account resource."
  value       = azurerm_cognitive_account.this
  sensitive   = true
}

output "cognitive_account_deployments" {
  description = "The Cognitive account deployment resources."
  value       = azurerm_cognitive_deployment.this
}

output "cognitive_account_projects" {
  description = "The Cognitive account project resources."
  value       = azurerm_cognitive_account_project.this
}

output "cognitive_account_rai_blocklists" {
  description = "The Cognitive account RAI blocklist resources."
  value       = azurerm_cognitive_account_rai_blocklist.this
}

output "cognitive_account_rai_policies" {
  description = "The Cognitive account RAI policy resources."
  value       = azurerm_cognitive_account_rai_policy.this
}