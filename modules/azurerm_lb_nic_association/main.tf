resource "azurerm_network_interface_backend_address_pool_association" "nic-lb_association" {
  for_each                = var.lb_association
  network_interface_id    = data.azurerm_network_interface.nic-data[each.key].id
  ip_configuration_name   = each.value.ip_configuration_name
  backend_address_pool_id = data.azurerm_lb_backend_address_pool.lb_backend-data[each.key].id
}


