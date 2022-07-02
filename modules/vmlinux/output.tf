output "linux_availability_set_name" {
  value = azurerm_availability_set.avset
}
output "linux_hostnames" {
  value = [azurerm_linux_virtual_machine.vm[*].name]
}
output "linux_private_ip_address" {
  value = [azurerm_linux_virtual_machine.vm[*].private_ip_address]
}
output "PIPs" {
  value = [azurerm_public_ip.pip[*].ip_address]
}
output "linux_dns" {
  value = [azurerm_public_ip.pip[*].domain_name_label]
}

output "linux_id"{
  value = azurerm_linux_virtual_machine.vm[*].id
}

output "linux_nic_id"{
  value = azurerm_network_interface.nic[*].id
}