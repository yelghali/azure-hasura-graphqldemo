data "azurerm_client_config" "current" {}

#Create KeyVault ID
resource "random_id" "kvname" {
  byte_length = 5
  prefix      = "keyvault"
}

resource "azurerm_key_vault" "default" {
  name                        = random_id.kvname.hex
  location = azurerm_resource_group.terrazuragrp.location
  resource_group_name = azurerm_resource_group.terrazuragrp.name
  tenant_id           = "${data.azurerm_client_config.current.tenant_id}"
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

}

# Secret
#resource "azurerm_key_vault_secret" "mysecret" {
#  name         = "HasuraDBSecret"
#  value        = "postgres://${azurerm_postgresql_flexible_server.terrazuraserverflx.administrator_login}:${azurerm_postgresql_flexible_server.terrazuraserverflx.administrator_password}@${azurerm_postgresql_flexible_server.terrazuraserverflx.fqdn}:5432/${var.pgdatabase}"
#  key_vault_id = "${azurerm_key_vault.default.id}"
#}

