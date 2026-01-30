data "azurerm_subnet" "subnet-lb-data" {
  for_each             = var.lbs
  name                 = each.value.subnet-lb-data
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}