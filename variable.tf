# variables.tf
variable "environment" {
  type        = string
  description = "Environment name (dev, test)"
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default = "rg-default-dotnet"
}

variable "location" {
  description = "Azure region to deploy resources into"
  type        = string
  default = "East US"
}

variable "vm_name" {
  description = "Name of the Virtual Machine"
  type        = string
  default     = "myvm"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "vm_size" {
  description = "Azure VM size"
  type        = string
  default     = "Standard_B1s"
}
