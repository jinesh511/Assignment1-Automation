output "Windows_vms_ops" {
  value = values(azurerm_windows_virtual_machine.WVM)[*].name
}

output "Windows_private_ip_address" {
  value = values(azurerm_windows_virtual_machine.WVM)[*].private_ip_address
}

output "Windows_public_ip_addresses" {
  value = values(azurerm_windows_virtual_machine.WVM)[*].public_ip_address
}

output "Windows_dns" {
  value = values(azurerm_public_ip.winpublicIp)[*].domain_name_label
}

output "Windows_avail_set_names" {
  value = azurerm_availability_set.winavailabilitySet
}

output "WVM" {
  value = azurerm_windows_virtual_machine.WVM
}
