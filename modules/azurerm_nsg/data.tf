data "azurerm_subnet" "subnet-nsg-data" {
  for_each             = var.nsgs
  name                 = each.value.subnet-nsg-data
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}


