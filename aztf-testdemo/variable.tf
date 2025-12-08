############################################
# VARIABLES
############################################
variable "environment" {
  type        = string
  description = "Environment name (dev, test)"
}
variable "resource_group_name" {}
variable "location" {}
variable "vm_name" { default = "myvm" }
variable "admin_username" { default = "azureuser" }
variable "vm_size" { default = "Standard_B1s" }
