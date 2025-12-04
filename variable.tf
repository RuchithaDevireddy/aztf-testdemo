variable "rg_name" {
  default = "rg-function-demo"
}

variable "location" {
  default = "eastus"
}

variable "function_app_name" {
  default = "mydemo-functionapp-001"
}

variable "storage_name" {
  default = "functionsa001demo"
}

variable "environment" {
  description = "Deployment environment name"
  type        = string
}
