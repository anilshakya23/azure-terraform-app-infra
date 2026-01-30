data "azurerm_network_interface" "gwt-nic-data" {
  for_each            = var.appgateway_nic
  name                = each.value.nic_data_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_application_gateway" "gwt-pool-data" {
  for_each            = var.appgateway_nic
  name                = each.value.backend_pool_data_name
  resource_group_name = each.value.resource_group_name
}
