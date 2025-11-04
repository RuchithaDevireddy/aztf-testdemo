terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.14.0"
    }
  }
}
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id      = "23804002-cbd4-473c-972d-2fffa924c8aa"
}