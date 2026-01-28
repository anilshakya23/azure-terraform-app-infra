data "azurerm_public_ip" "pip-data" {
  for_each            = var.lbs
  name                = each.value.pip-lb-data
  resource_group_name = each.value.resource_group_name
}