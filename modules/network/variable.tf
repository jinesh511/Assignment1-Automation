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
  default = "7301-assignment1-RG"
  description = "This is resource group for 01517301"
}

variable "location" {
  default = "East Asia"
}

variable "vnet" {
  default = "network-vnet"
}

variable "vnet_space" {
  default = ["10.0.0.0/16"]
}

variable "subnet" {
  default = "network-subnet"
}

variable "subnet_space" {
  default = ["10.0.1.0/24"]
}