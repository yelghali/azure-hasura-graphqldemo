resource "azurerm_postgresql_server" "terrazuraserver" {
  name                        = "${random_string.myprefix.result}pgsqldemo"
  location = azurerm_resource_group.terrazuragrp.location
  resource_group_name = azurerm_resource_group.terrazuragrp.name
  sku_name = "B_Gen5_2"

  storage_mb = "5120"
  backup_retention_days = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled = true

  administrator_login = var.username
  administrator_login_password = var.password
  ssl_enforcement_enabled = true
  version = "11"
}
