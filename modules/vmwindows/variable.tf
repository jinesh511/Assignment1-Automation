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

variable "windows_name" {
  type = map(string)
  default = {
    "n01517301-w-vm1" = "Standard_B1s"
  }
}

variable "windows_avs" {
  default = "winavailabilitySet"
}

variable "nb_count" {
  default = "2"
}


variable "OSWindowsInfo" {
  type = map(string)
  default = {
    OS_Windows_publisher = "MicrosoftWindowsServer"
    OS_Windows_Offer     = "WindowsServer"
    OS_Sku               = "2016-Datacenter"
    OS_version           = "latest"
  }
}

variable "size" {
  default = "Standard_B1s"
}

variable "username" {
  default = "jinesh-n01517301"
}

variable "password" {
  default = "Humber@2022"
}


variable "os_disk_attr" {
  type = map(string)
  default = {
    stroage_acc_type = "StandardSSD_LRS"
    disk_size        = "128"
    caching          = "ReadWrite"
    create_option = "Attach"
  }
}

variable "storage_account_uri" {
    default = ""
}

variable "vme" {
  type = map(string)
  default = {
    publisher  = "Microsoft.Azure.Security.AntimalwareSignature"
    type  = "AntimalwareConfiguration"
    type_handler_version ="2.58"
  }
}
