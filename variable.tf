# Terraform variables

variable "environment" {
  description = "Deployment environment (dev/test/prod)"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "centralus"
}


variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "example-rg"
}

variable "vnet_name" {
  description = "Virtual Network name"
  type        = string
  default     = "example-vnet"
}

variable "vnet_address_space" {
  description = "VNet address space"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
  default     = "example-subnet"
}

variable "subnet_address_prefix" {
  description = "Subnet address prefix"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "nic_name" {
  description = "Network Interface name"
  type        = string
  default     = "example-nic"
}

variable "vm_name" {
  description = "Virtual Machine name"
  type        = string
  default     = "example-vm"
}

variable "vm_size" {
  description = "VM size"
  type        = string
  default     = "Standard_B1ms"
}

variable "admin_username" {
  description = "Admin username for VM"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key" {
  description = "SSH public key for VM access"
  type        = string
}

variable "os_publisher" {
  description = "OS image publisher"
  type        = string
  default     = "Canonical"
}

variable "os_offer" {
  description = "OS image offer"
  type        = string
  default     = "UbuntuServer"
}

variable "os_sku" {
  description = "OS image SKU"
  type        = string
  default     = "18.04-LTS"
}

variable "os_version" {
  description = "OS image version"
  type        = string
  default     = "latest"
}
