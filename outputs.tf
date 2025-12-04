output "resource_group_name" {
  value       = azurerm_resource_group.rg.name
  description = "Name of the resource group."
}

output "function_app_name" {
  value       = azurerm_windows_function_app.func.name
  description = "Name of the Azure Function App."
}

output "storage_account_name" {
  value       = azurerm_storage_account.sa.name
  description = "Storage account name."
}

output "app_insights_connection_string" {
  value       = azurerm_application_insights.appi.connection_string
  sensitive   = true
  description = "App Insights connection string."
}
