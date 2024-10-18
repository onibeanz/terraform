resource "azurerm_mssql_server" "sqlserver" {
  name                         = "sqlsrv-${lower(var.base-name)}-${var.random-string}"
  resource_group_name          = var.rg-name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = var.admin-password
}

resource "azurerm_mssql_database" "sqldb" {
  name         = "db_sql-${var.base-name}"
  server_id    = azurerm_mssql_server.sqlserver.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

  tags = {
    foo = "bar"
  }

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}