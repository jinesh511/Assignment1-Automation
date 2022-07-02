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

variable "linux_nic_id" {
    default = ""
}

variable "linux_name" {
  default = "n01517301-db1-u-vm1"
}