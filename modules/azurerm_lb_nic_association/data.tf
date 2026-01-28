data "azurerm_lb" "lb-data" {
  for_each            = var.lb_association
  name                = each.value.lb_data_nama
  resource_group_name = each.value.resource_group_name
}

data "azurerm_lb_backend_address_pool" "lb_backend-data" {
  for_each        = var.lb_association
  name            = each.value.lb_backend_name
  loadbalancer_id = data.azurerm_lb.lb-data[each.key].id
}

data "azurerm_network_interface" "nic-data" {
  for_each            = var.lb_association
  name                = each.value.nic_data_name
  resource_group_name = each.value.resource_group_name
}
