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


variable "log_analytics_workspace" {
    type = map(string)
    default = {
        name = "og-analytics-workspace-7301"
        sku = "PerGB2018"
        ret-in-days = 30
    }
}

variable "recovery_services_vault" {
    type = map(string)
    default = {
        name = "vault-7301"
        sku = "Standard"
    }
}

variable "storage_account" {
    type = map(string)
    default = {
        name = "7301assignment1"
        account_tier = "Standard"
        account_replication_type = "LRS"
    }
}

variable "storage_container" {
    type = map(string)
    default = {
        name = "storage-container-7301"
        container_access_type = "private"
    }
}

variable "storage_blob" {
    type = map(string)
    default = {
        name = "storage-blob-7301"
        type  = "Block"
    }
}