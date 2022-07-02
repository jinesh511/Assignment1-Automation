resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet
  location            = var.location
  resource_group_name = var.rg
  address_space       = var.vnet_space
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet
  resource_group_name  = var.rg
  virtual_network_name = var.vnet
  address_prefixes     = var.subnet_space
  depends_on = [azurerm_virtual_network.vnet ]
}
