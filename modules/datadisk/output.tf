output "data_disk_windows" {
    value = azurerm_managed_disk.data_disk_windows
}

output "data_disk_attach_windows" {
    value = azurerm_virtual_machine_data_disk_attachment.data_disk_attach_windows
}

output "data_disk_linux" {
    value = [azurerm_managed_disk.data_disk_linux[*]]
}

output "data_disk_attach_linux" {
    value = [azurerm_virtual_machine_data_disk_attachment.data_disk_attach_linux[*]]
}
