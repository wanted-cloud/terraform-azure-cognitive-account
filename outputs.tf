output "congnitive_account" {
  description = "The Cognitive account resource."
  value       = azurerm_cognitive_account.this
}

output "congnitive_account_deployments" {
  description = "The Cognitive account deployment resources."
  value       = azurerm_cognitive_deployment.this

}