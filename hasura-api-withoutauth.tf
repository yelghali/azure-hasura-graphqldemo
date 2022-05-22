
resource "azurerm_app_service_plan" "my_service_plan" {
 name                = "my_service_plan"
 location = azurerm_resource_group.terrazuragrp.location
 resource_group_name = azurerm_resource_group.terrazuragrp.name
 kind                = "Linux"
 reserved            = true

 sku {
   tier     = "PremiumV2"
   size     = "P1v2"
   #capacity = "3"
 }
}


resource "azurerm_app_service" "hasura_app_service_container" {
 name                        = "${random_string.myprefix.result}apphasura"
 location = azurerm_resource_group.terrazuragrp.location
 resource_group_name = azurerm_resource_group.terrazuragrp.name
 app_service_plan_id     = azurerm_app_service_plan.my_service_plan.id
 https_only              = true
 #client_affinity_enabled = true

 site_config {
   always_on = "true"
   linux_fx_version  = "DOCKER|hasura/graphql-engine:v2.0.1" #define the images to usecfor you application
   app_command_line = "graphql-engine serve --server-port 80 --enable-console"
   #app_command_line = "graphql-engine serve "

 }

  identity {
    type = "SystemAssigned"
  }

    app_settings = {

      HASURA_GRAPHQL_DATABASE_URL = "postgres://${var.username}%40${azurerm_postgresql_server.terrazuraserver.name}:${var.password}@${azurerm_postgresql_server.terrazuraserver.fqdn}:5432/${var.pgdatabase}"

      #HASURA_GRAPHQL_DATABASE_URL = "@Microsoft.KeyVault(SecretUri=${azurerm_key_vault.default.vault_uri}secrets/${azurerm_key_vault_secret.mysecret.name}/${azurerm_key_vault_secret.mysecret.version})"

      HASURA_GRAPHQL_SERVER_PORT = var.apiport
      HASURA_GRAPHQL_ENABLE_CONSOLE = true
     HASURA_GRAPHQL_JWT_SECRET__ = "{  \"jwk_url\" : https://login.windows.net/common/discovery/keys,   \"claims_map\" : {     \"x-hasura-allowed-roles\" : { \"path\": \"$.roles\" }, \"x-hasura-default-role\": { \"path\": \"$.roles[0]\" },     \"x-hasura-user-id\": { \"path\": \"$.oid\" }   } }"
      #HASURA_GRAPHQL_DATABASE_URL = "postgres://${var.username}%40${azurerm_postgresql_flexible_server.terrazuraserverflx.name}:${var.password}@${azurerm_postgresql_flexible_server.terrazuraserverflx.fqdn}:5432/${var.pgdatabase}"
      #HASURA_SQLSERVER_URL = "Driver={ODBC Driver 17 for SQL Server};Server=${azurerm_sql_server.sqlserver.fully_qualified_domain_name};Database=${var.sqlserverdb};UID=${var.sqluid};PWD=${var.sqlpwd};"

}


}


