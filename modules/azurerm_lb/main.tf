resource "azurerm_lb" "lb" {
  for_each            = var.lbs
  name                = each.value.lb_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

frontend_ip_configuration {
  name                          = each.value.frontend_ip_configuration.frontend_ip_name
  subnet_id                     = data.azurerm_subnet.subnet-lb-data[each.key].id
  private_ip_address_allocation = "Dynamic"
}
}

resource "azurerm_lb_probe" "lb_probe" {
  for_each        = var.lbs
  loadbalancer_id = azurerm_lb.lb[each.key].id
  name            = each.value.lb_probe_name
  port            = 22
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  for_each        = var.lbs
  loadbalancer_id = azurerm_lb.lb[each.key].id
  name            = each.value.backend_pool_name
}

resource "azurerm_lb_rule" "lb_rule" {
  for_each                       = var.lbs
  loadbalancer_id                = azurerm_lb.lb[each.key].id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = each.value.ip_confi_name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend_pool[each.key].id]
  probe_id                       = azurerm_lb_probe.lb_probe[each.key].id
}



