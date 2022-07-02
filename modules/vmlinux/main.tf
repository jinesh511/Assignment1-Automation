resource "azurerm_availability_set" "avset" {
  name                         = var.linux_avs
  location                     = var.location
  resource_group_name          = var.rg
  platform_fault_domain_count  = "2"
  platform_update_domain_count = "5"
}

resource "azurerm_network_interface" "nic" {
  count               = var.nb_count
  name                = "${var.linux_name}-nic-${format("%1d", count.index + 1)}"
  location            = var.location
  resource_group_name = var.rg
  tags                = local.common_tags

  ip_configuration {
    name                          = "${var.linux_name}-ipconfig-${format("%1d", count.index + 1)}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.pip[*].id, count.index + 1)
  }
}

resource "azurerm_public_ip" "pip" {
  count               = var.nb_count
  name                = "${var.linux_name}-pip-${format("%1d", count.index + 1)}"
  resource_group_name = var.rg
  location            = var.location
  allocation_method   = "Static"
  domain_name_label   = "${var.linux_name}-dns-${format("%1d", count.index + 1)}"
  tags                = local.common_tags
}

resource "azurerm_linux_virtual_machine" "vm" {
  count                           = var.nb_count
  name                            = "${var.linux_name}${format("%1d", count.index + 1)}"
  computer_name                   = "${var.linux_name}-nic-${format("%1d", count.index + 1)}"
  resource_group_name             = var.rg
  location                        = var.location
  size                            = var.size
  admin_username                  = var.username
  disable_password_authentication = false
  admin_password                  = var.passowrd
  tags                            = local.common_tags
  network_interface_ids = [
    element(azurerm_network_interface.nic[*].id, count.index + 1)
  ]
  availability_set_id = azurerm_availability_set.avset.id
  os_disk {
    name                 = "${var.linux_name}-os-disk-${format("%1d", count.index + 1)}"
    caching              = var.disk_caching
    storage_account_type = var.disk_storage
  }

  source_image_reference {
    publisher = var.publisher_os
    offer     = var.offer_os
    sku       = var.sku_os
    version   = var.version_os
  }
 
  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }

  depends_on = [azurerm_availability_set.avset]
}

resource "azurerm_virtual_machine_extension" "vme" {
  count               = var.nb_count
  name                = "${var.linux_name}-vme-${format("%1d", count.index + 1)}"
  virtual_machine_id   = azurerm_linux_virtual_machine.vm[count.index].id
  publisher            = var.vme["publisher"]
  type                 = var.vme["type"]
  type_handler_version = var.vme["type_handler_version"]

  depends_on = [null_resource.linux_provisioner]

  tags                = local.common_tags
}