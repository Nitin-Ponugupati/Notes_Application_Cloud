resource "azurerm_service_plan" "plan" {
  name                = "asp-notes-app"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "app" {
  name                = var.app_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    health_check_path = "/health"

    application_stack {
      dotnet_version = "10.0"
    }
  }

  app_settings = {
    "ASPNETCORE_ENVIRONMENT"                = "Production"
    "APPLICATIONINSIGHTS_CONNECTION_STRING" = azurerm_application_insights.appinsights.connection_string
    "ConnectionStrings__DefaultConnection"  = "Server=tcp:${azurerm_mssql_server.sql_server.fully_qualified_domain_name},1433;Database=${azurerm_mssql_database.notes_prod_db.name};User ID=${var.sql_admin_login};Password=${var.sql_admin_password};Encrypt=true;"
  }
}

# Staging slot
resource "azurerm_linux_web_app_slot" "staging" {
  name           = var.staging_slot_name
  app_service_id = azurerm_linux_web_app.app.id

  site_config {
    health_check_path = "/health"

    application_stack {
      dotnet_version = "10.0"
    }
  }

  app_settings = {
    "ASPNETCORE_ENVIRONMENT"                = "Staging"
    "APPLICATIONINSIGHTS_CONNECTION_STRING" = azurerm_application_insights.appinsights.connection_string
    "ConnectionStrings__DefaultConnection"  = "Server=tcp:${azurerm_mssql_server.sql_server.fully_qualified_domain_name},1433;Database=${azurerm_mssql_database.notes_staging_db.name};User ID=${var.sql_admin_login};Password=${var.sql_admin_password};Encrypt=true;"
  }
}

resource "azurerm_app_service_virtual_network_swift_connection" "app_vnet_integration" {
  app_service_id = azurerm_linux_web_app.app.id
  subnet_id      = azurerm_subnet.app_integration_subnet.id
}