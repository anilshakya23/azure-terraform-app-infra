variable "sql_database" {
  type = map(object({
    sql_name                     = string
    resource_group_name          = string
    location                     = string
    db_name                      = string
    collation                    = string
    license_type                 = string
    administrator_login          = string
    administrator_login_password = string
  }))

}
