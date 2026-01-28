data "azurerm_subnet" "subnet-data" {
  for_each             = var.vms
  name                 = each.value.subnet-vm-data
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

