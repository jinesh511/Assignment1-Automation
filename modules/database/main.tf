resource "azurerm_postgresql_server" "dbserver" {
  name                = var.server_name
  location            = var.location
  resource_group_name = var.rg
  sku_name = "B_Gen5_2"
  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  administrator_login          = "admin7301"
  administrator_login_password = "Humber@2022"
  version                      = "9.5"
  ssl_enforcement_enabled      = true
}

resource "azurerm_postgresql_database" "db" {
  name                = "db"
  resource_group_name = var.rg
  server_name         = azurerm_postgresql_server.dbserver.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}