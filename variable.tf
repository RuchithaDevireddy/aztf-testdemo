variable "rg_name" {
  type    = string
  default = "tf-github-actions-rg"
}
variable "location" {
  type    = string
  default = "West Europe" # change to your region
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
  description = "Environment name (dev or test)"
  type        = string
  default     = "dev"
}

