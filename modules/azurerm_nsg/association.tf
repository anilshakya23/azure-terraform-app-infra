resource "azurerm_subnet_network_security_group_association" "subnet-nsg" {
  for_each                  = var.nsgs
  subnet_id                 = data.azurerm_subnet.subnet-nsg-data[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id
}
