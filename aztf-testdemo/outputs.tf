output "vm_public_ip" {
description = "Public IP of the VM"
value = azurerm_public_ip.pip.ip_address
}


output "vm_ssh_private_key" {
description = "Private SSH key for GitHub Actions"
value = tls_private_key.vm_key.private_key_pem
sensitive = true
}


output "vm_ssh_public_key" {
description = "Public SSH key"
value = tls_private_key.vm_key.public_key_openssh
}
