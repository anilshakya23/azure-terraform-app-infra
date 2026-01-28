data "azurerm_public_ip" "pip-basion-data" {
  for_each            = var.bastion
  name                = each.value.pip-bastion-data
  resource_group_name = each.value.resource_group_name
}

data "azurerm_subnet" "subnet-bastion-data" {
  for_each             = var.bastion
  name                 = each.value.subnet-bastion-data
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
