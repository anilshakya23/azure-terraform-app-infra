resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "gwt-nic" {
  for_each              = var.appgateway_nic

  network_interface_id  = data.azurerm_network_interface.gwt-nic-data[each.key].id
  ip_configuration_name = each.value.ip_configuration_name

  backend_address_pool_id = one([
    for p in data.azurerm_application_gateway.gwt-pool-data[each.key].backend_address_pool :
    p.id if p.name == each.value.backend_pool_data_name
  ])
}



