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

variable "depend_on" {
    default = ""
}

variable "windows_id" {
    default = ""
}

variable "linux_id" {
    default = ""
}

variable "windows_name" {
    default = ""
}

variable "linux_name" {
    default = ""
}


variable "storage_account_type" {
    default = "Standard_LRS"
}

variable "create_option" {
    default = "Empty"
}

variable "disk_size_gb" {
    default = 10
}

variable "lun" {
    default = 0
}

variable "data_disk_caching" {
    default = "ReadWrite"
}

