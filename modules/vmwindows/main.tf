
resource "azurerm_network_interface" "Wnet_interface" {
  for_each            = var.windows_name
  name                = "${each.key}-nic"
  resource_group_name = var.rg
  location            = var.location
  tags                = local.common_tags

  ip_configuration {
    name                          = "${each.key}-ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.winpublicIp[each.key].id
  }
}

resource "azurerm_public_ip" "winpublicIp" {
  for_each            = var.windows_name
  name                = "${each.key}-pip"
  resource_group_name = var.rg
  location            = var.location
  domain_name_label   = "${each.key}-dns"
  allocation_method   = "Static"
  tags                = local.common_tags
}


resource "azurerm_windows_virtual_machine" "WVM" {
  for_each            = var.windows_name
  name                = each.key
  computer_name       = each.key
  resource_group_name = var.rg
  location            = var.location
  size                = var.size
  admin_username      = var.username
  admin_password      = var.password
  tags                = local.common_tags
  network_interface_ids = [
    azurerm_network_interface.Wnet_interface[each.key].id
  ]


  os_disk {
    name                 = "${each.key}-os-disk"
    caching              = var.os_disk_attr["caching"]
    storage_account_type = var.os_disk_attr["stroage_acc_type"]
  }

  source_image_reference {
    publisher = var.OSWindowsInfo["OS_Windows_publisher"]
    offer     = var.OSWindowsInfo["OS_Windows_Offer"]
    sku       = var.OSWindowsInfo["OS_Sku"]
    version   = var.OSWindowsInfo["OS_version"]
  }

  winrm_listener {
    protocol = "Http"
  }

  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }

  depends_on = [azurerm_availability_set.winavailabilitySet]
}

resource "azurerm_availability_set" "winavailabilitySet" {
  name                         = var.windows_avs
  location                     = var.location
  resource_group_name          = var.rg
  platform_fault_domain_count  = "2"
  platform_update_domain_count = "5"
}

resource "azurerm_virtual_machine_extension" "vmexe" {
  for_each            = var.windows_name
  name                = "${var.windows_name[each.key]}-vmexe"
  virtual_machine_id   = azurerm_windows_virtual_machine.WVM[each.key].id
  publisher            = var.vme["publisher"]
  type                 = var.vme["type"]
  type_handler_version = var.vme["type_handler_version"]
  tags                = local.common_tags
}






