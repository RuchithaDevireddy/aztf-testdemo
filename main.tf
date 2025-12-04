
# ---------------------------
# Resource Group
# ---------------------------
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

# ---------------------------
# Storage Account (required)
# ---------------------------
resource "azurerm_storage_account" "sa" {
  name                     = var.storage_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# ---------------------------
# Application Insights
# ---------------------------
resource "azurerm_application_insights" "appi" {
  name                = "${var.function_app_name}-ai"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = "web"
}

# ---------------------------
# Consumption Plan
# ---------------------------
resource "azurerm_service_plan" "plan" {
  name                = "${var.function_app_name}-plan"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Windows"
  sku_name            = "Y1"
}

# ---------------------------
# Function App
# ---------------------------
resource "azurerm_windows_function_app" "func" {
  name                       = var.function_app_name
  location                   = var.location
  resource_group_name        = azurerm_resource_group.rg.name
  service_plan_id           = azurerm_service_plan.plan.id
  storage_account_name      = azurerm_storage_account.sa.name
  storage_account_access_key = azurerm_storage_account.sa.primary_access_key

  site_config {
    application_insights_connection_string = azurerm_application_insights.appi.connection_string
  }

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
  }
}


