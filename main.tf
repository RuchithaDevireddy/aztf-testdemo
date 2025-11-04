resource "azurerm_resource_group" "rg" {
  name     = "rg-example-terraform"
  location = var.location
}

resource "azurerm_storage_account" "sa" {
  name                     = "exampletfsa1234"  # must be globally unique, lowercase, 3-24 chars
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}