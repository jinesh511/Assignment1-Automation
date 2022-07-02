resource "azurerm_managed_disk" "data_disk_windows" {
  name                 = "n01517301-data-disk"
  resource_group_name = var.rg
  location            = var.location
  storage_account_type = var.storage_account_type
  create_option        = var.create_option
  disk_size_gb         = var.disk_size_gb
  tags                = local.common_tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attach_windows" {
  managed_disk_id    = azurerm_managed_disk.data_disk_windows.id
  virtual_machine_id = var.windows_id
  lun                = var.lun
  caching            = var.data_disk_caching
  depends_on = [azurerm_managed_disk.data_disk_windows]
}

 resource "azurerm_managed_disk" "data_disk_linux" {
 #for_each             = var.linux_name
  #name                 = "${each.key}-data-disk"
  count = 2
  name = "linux-dd-${format("%1d", count.index + 1)}"
  resource_group_name = var.rg
  location            = var.location
  storage_account_type = var.storage_account_type
  create_option        = var.create_option
  disk_size_gb         = var.disk_size_gb
  tags                 = local.common_tags
  depends_on           = [var.depend_on]
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attach_linux" {
  count = 2
  #for_each           = var.linux_name
  #managed_disk_id    = azurerm_managed_disk.linux_data_disk[each.key].id 
  managed_disk_id = element(azurerm_managed_disk.data_disk_linux[*].id,count.index+1)
  virtual_machine_id = var.linux_id[count.index]
  lun                = var.lun
  caching            = var.data_disk_caching
  depends_on = [azurerm_managed_disk.data_disk_linux]
}
