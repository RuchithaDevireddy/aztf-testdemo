##################################################
# 1. Resource Group
##################################################
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

##################################################
# 2. Virtual Network 1 + Subnet 1
##################################################
resource "azurerm_virtual_network" "vnet1" {
  name                = "${var.rg_name}-vnet1"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet1" {
  name                 = "${var.rg_name}-subnet1"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.0.1.0/24"]

  depends_on = [azurerm_virtual_network.vnet1]
}

##################################################
# 3. Virtual Network 2 + Subnet 2
##################################################
resource "azurerm_virtual_network" "vnet2" {
  name                = "${var.rg_name}-vnet2"
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  depends_on = [azurerm_virtual_network.vnet1]
}

resource "azurerm_subnet" "subnet2" {
  name                 = "${var.rg_name}-subnet2"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet2.name
  address_prefixes     = ["10.1.1.0/24"]

  depends_on = [azurerm_virtual_network.vnet2]
}

##################################################
# 4. Public IPs
##################################################
resource "azurerm_public_ip" "pip1" {
  name                = "${var.rg_name}-pip1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_public_ip" "pip2" {
  name                = "${var.rg_name}-pip2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

##################################################
# 5. Network Interfaces
##################################################
resource "azurerm_network_interface" "nic1" {
  name                = "${var.rg_name}-nic1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip1.id
  }

  depends_on = [azurerm_subnet.subnet1, azurerm_public_ip.pip1]
}

resource "azurerm_network_interface" "nic2" {
  name                = "${var.rg_name}-nic2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "ipconfig2"
    subnet_id_
