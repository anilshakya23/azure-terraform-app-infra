resource "azurerm_mssql_server" "sql-server" {
  for_each                     = var.sql_database
  name                         = each.value.sql_name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
}

resource "azurerm_mssql_database" "sql-data" {
  for_each     = var.sql_database
  name         = each.value.db_name
  server_id    = azurerm_mssql_server.sql-server[each.key].id
  collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"
}
