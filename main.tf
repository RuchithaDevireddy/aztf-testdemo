#Generate SSH key
# -----------------------------
resource "tls_private_key" "vm_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# -----------------------------
# Resource Group
# -----------------------------
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# -----------------------------
# Virtual Network
# -----------------------------
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.environment}"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  timeouts {
    create = "30m"
    update = "30m"
  }
}

# -----------------------------
# Subnet
# -----------------------------
resource "azurerm_subnet" "subnet" {
  name                 = "subnet-${var.environment}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# -----------------------------
# Network Security Group
# -----------------------------
resource "azurerm_network_security_group" "nsg" {
  name                = "nsg-${var.environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  depends_on = [azurerm_virtual_network.vnet]

  timeouts {
    create = "15m"
  }
}

# -----------------------------
# Public IP
# -----------------------------
resource "azurerm_public_ip" "public_ip" {
  name                = "pip-${var.environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"

  depends_on = [azurerm_network_security_group.nsg]

  timeouts {
    create = "15m"
  }
}

# -----------------------------
# Network Interface
# -----------------------------
resource "azurerm_network_interface" "nic" {
  name                = "nic-${var.environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }

  depends_on = [azurerm_public_ip.public_ip, azurerm_network_security_group.nsg]
}

# -----------------------------
# Linux VM
# -----------------------------
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "vm-${var.environment}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = var.vm_size
  admin_username      = "azureuser"
  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  disable_password_authentication = true

  admin_ssh_key {
    username   = "azureuser"
    public_key = tls_private_key.vm_key.public_key_openssh
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name                 = "osdisk-${var.environment}"
  }

  depends_on = [azurerm_network_interface.nic]

  timeouts {
    create = "30m"
    delete = "30m"
  }
}
