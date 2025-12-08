############################################
# OUTPUTS
############################################


output "private_key_path" {
value = local_file.private_key.filename
}


output "public_ip" {
value = azurerm_public_ip.public_ip.ip_address
}
