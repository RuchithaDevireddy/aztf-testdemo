variable "rg_name" {
  type    = string
  default = "demo-multi-vm-rg"
}

variable "location" {
  type    = string
  default = "East US"
}

variable "vm_size" {
  type    = string
  default = "Standard_B1s"
}

variable "admin_username" {
  type    = string
  default = "azureuser"
}

variable "ssh_public_key_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}
variable "environment" {
  description = "Deployment environment name"
  type        = string
}
