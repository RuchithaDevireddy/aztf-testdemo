output "vm_public_ip" {
  value       = azurerm_public_ip.public_ip.ip_address
  description = "Public IP of the VM"
}

output "vm_ssh_private_key" {
  value       = tls_private_key.vm_key.private_key_pem
  sensitive   = true
  description = "Private key for SSH access"
}

