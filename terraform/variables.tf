variable "resource_group_name" {
  type    = string
  default = "rg-notes-app"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "sql_location" {
  type        = string
  default     = "centralus"
  description = "Region for Azure SQL resources (some regions restrict SQL provisioning)"
}

variable "app_name" {
  type    = string
  default = "app-notes-application"
}

variable "sql_server_name" {
  type    = string
  default = "sql-notes-app"
}

variable "sql_prod_database_name" {
  type    = string
  default = "notes-production"
}

variable "sql_admin_login" {
  type    = string
  default = "sqladmin"
}

variable "sql_admin_password" {
  type      = string
  sensitive = true
}

variable "sql_staging_database_name" {
  type    = string
  default = "notes-staging"
}

variable "staging_slot_name" {
  type    = string
  default = "staging"
}
