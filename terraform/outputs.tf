output "app_service_default_hostname" {
  value = azurerm_linux_web_app.app.default_hostname
}

output "staging_slot_hostname" {
  value = azurerm_linux_web_app_slot.staging.default_hostname
}

output "sql_server_fqdn" {
  value = azurerm_mssql_server.sql_server.fully_qualified_domain_name
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}
