# Resource Group
output "rg"{
    value = module.rgroup.rg.name
}

#Network Output
output "vnet" {
  value = module.network.vnet.name
}
output "subnet" {
  value = module.network.subnet.name
}
output "subnet_space" {
  value = module.network.subnet.address_prefixes
}

#Common Output
output "log_analytics_workspace" {
  value = module.common.log_analytics_workspace.name
}
output "recovery_services_vault" {
  value = module.common.recovery_services_vault.name
}
output "storage_account" {
  value = module.common.storage_account.name
}

#Linux Output
output "linux_hostnames" {
  value = module.linux.linux_hostnames
}

output "PIPs" {
  value = module.linux.PIPs
}

output "linux_private_ip_address" {
  value = module.linux.linux_private_ip_address
}

output "linux_dns" {
  value = module.linux.linux_dns
}

#Windows Output
output "Windows_vms_ops" {
  value = module.windows.Windows_vms_ops
}

output "Windows_private_ip_address" {
  value = module.windows.Windows_private_ip_address
}

output "Windows_public_ip_addresses" {
  value = module.windows.Windows_public_ip_addresses
}

output "Windows_dns" {
  value = module.windows.Windows_dns
}

#Database Name
output "db" {
  value = module.database.db
}