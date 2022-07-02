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
