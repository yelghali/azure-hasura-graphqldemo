
resource "azurerm_postgresql_database" "terrazuradb" {
  name = var.pgdatabase
  resource_group_name = azurerm_resource_group.terrazuragrp.name
  server_name = azurerm_postgresql_server.terrazuraserver.name
  charset = "UTF8"
  collation = "English_United States.1252"
}

