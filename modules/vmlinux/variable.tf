locals {
  common_tags = {
  Project        = "Automation Project – Assignment 1"
  Name           = "Jinesh.Kansara"
  StuId          = "N01517301"
  ExpirationDate = "2022-06-30"
  Environment    = "Lab"
  }
}

variable "rg" {
}

variable "location" {
}

variable "subnet_id" {
    default = ""
}

variable "linux_name" {
  default = "n01517301-db1-u-vm1"
}

variable "linux_id" {
 default = ""
}

variable "linux_avs" {
  default = "linux-aset-7301"
}
variable "nb_count" {
  default = "2"
}
variable "size" {
  default = "Standard_B1s"
}
variable "username" {
  default = "jineshn01517301"
}
variable "passowrd" {
  default = "Humber@2022"
}
variable "disk_storage" {
  default = "Premium_LRS"
}
variable "disk_size" {
  default = "32"
}
variable "disk_caching" {
  default = "ReadWrite"
}
variable "publisher_os" {
  default = "OpenLogic"
}
variable "offer_os" {
  default = "CentOS"
}
variable "sku_os" {
  default = "8_2"
}
variable "version_os" {
  default = "latest"
}
variable "storage_account_uri" {
    default = ""
}
variable "vme" {
  type = map(string)
  default = {
    publisher  = "Microsoft.Azure.NetworkWatcher"
    type  = "NetworkWatcherAgentLinux"
    type_handler_version ="1.4"
  }
}
