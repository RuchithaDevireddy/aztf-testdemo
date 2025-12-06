variable "environment" {
  type        = string
  description = "Environment name (dev, test)"
}

variable "location" {
  type        = string
  default     = "eastus2"
}

variable "vm_size" {
  type        = string
  default     = "Standard_B1ms"
}

variable "admin_username" {
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key"
}

variable "vnet_address_space" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_address_prefix" {
  type    = string
  default = "10.0.1.0/24"
}
