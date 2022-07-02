resource "azurerm_public_ip" "pip_lb" {
  name                = "PublicIPForLB"
  location            = var.location
  resource_group_name = var.rg
  allocation_method   = "Static"
}

resource "azurerm_lb" "lb" {
  name                = "lb"
  location            = var.location
  resource_group_name = var.rg

  frontend_ip_configuration {
    name                 = "PublicIP"
    public_ip_address_id = azurerm_public_ip.pip_lb.id
  }
}


resource "azurerm_lb_backend_address_pool" "lb_pool" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "BackEndAddressPool"
}

resource "azurerm_network_interface_backend_address_pool_association" "lb_vm_association" {
  count                   = 2
  network_interface_id    = var.linux_nic_id[count.index]
  ip_configuration_name   = "${var.linux_name}-ipconfig-${format("%1d", count.index + 1)}"
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_pool.id
}
