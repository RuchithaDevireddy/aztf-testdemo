# Azure Provider Variables
variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "example-rg"
}

# Virtual Network Variables
variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
  default     = "example-vnet"
}

variable "vnet_address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "example-subnet"
}

variable "subnet_address_prefix" {
  description = "Address prefix for the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

# Network Interface Variables
variable "nic_name" {
  description = "Name of the Network Interface"
  type        = string
  default     = "example-nic"
}

# VM Variables
variable "vm_name" {
  description = "Name of the Virtual Machine"
  type        = string
  default     = "example-vm"
}

variable "vm_size" {
  description = "Size of the Virtual Machine"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  description = "Path to the public SSH key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

# OS Image Variables
variable "os_publisher" {
  description = "OS Image Publisher"
  type        = string
  default     = "Canonical"
}

variable "os_offer" {
  description = "OS Image Offer"
  type        = string
  default     = "UbuntuServer"
}

variable "os_sku" {
  description = "OS Image SKU"
  type        = string
  default     = "18.04-LTS"
}

variable "os_version" {
  description = "OS Image Version"
  type        = string
  default     = "latest"
}
variable "environment" {
  description = "Deployment environment (e.g., dev, test)"
  type        = string
  default     = "dev"
}
