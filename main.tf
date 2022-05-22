terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      #version = "2.41.0"
      version = "3.3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "terrazuragrp" {
  name = "hasuragraphql_grpdemo"
  location = "francecentral"
}

variable "username" {}

variable "password" {}

variable "server" {}

variable "apiport" {}

variable "pgdatabase" {}

variable "sqlserverdb" {}

variable "sqluid" {}

variable "sqlpwd" {}


#output "sqlserver_dsn" {
#  value="Driver={ODBC Driver 17 for SQL Server};Server=${azurerm_sql_server.sqlserver.fully_qualified_domain_name};Database=${var.sqlserverdb};UID=${var.sqluid};PWD=${var.sqlpwd};"
#}
