terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaten01517301RG"
    storage_account_name = "tfstaten01517301sa"
    container_name       = "tfstatefiles"
    key                  = "tfstatekey"
  }
}
