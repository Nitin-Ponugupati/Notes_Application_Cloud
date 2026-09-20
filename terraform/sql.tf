resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = var.sql_location
  version                      = "12.0"
  administrator_login          = var.sql_admin_login
  administrator_login_password = var.sql_admin_password

  # Disabled because access will only be allowed via the Private Endpoint
  public_network_access_enabled = false
}

resource "azurerm_mssql_database" "sql_db" {
  name      = var.sql_database_name
  server_id = azurerm_mssql_server.sql_server.id
  sku_name  = "Basic"
}
