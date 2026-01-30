resource "azurerm_application_gateway" "app-gwt" {
  for_each            = var.appgateways
  name                = each.value.appgateways_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = each.value.gateway_ip_configuration.gateway_name
    subnet_id = data.azurerm_subnet.subnet-data[each.key].id
  }

  dynamic "frontend_port" {
    for_each = each.value.frontend_port
    content {
      name = frontend_port.value.frontend_port_name
      port = 80
    }
  }

  dynamic "frontend_ip_configuration" {
    for_each = each.value.frontend_ip_configuration
    content {
      name                 = frontend_ip_configuration.value.frontend_ip_configuration_name
      public_ip_address_id = data.azurerm_public_ip.pip-data[each.key].id
    }

  }

dynamic "backend_address_pool" {
  for_each = each.value.backend_address_pool_name
  content {
    name = backend_address_pool.value.backend_address_pool_name
  }
}

  dynamic "backend_http_settings" {
    for_each = each.value.backend_http_settings
    content {
      name                  = backend_http_settings.value.backend_http_settings_name
      cookie_based_affinity = "Disabled"
      path                  = "/path1/"
      port                  = 80
      protocol              = "Http"
      request_timeout       = 60
    }

  }

dynamic "http_listener" {
  for_each = each.value.http_listener
  content {
    name                           = http_listener.value.http_listener_name
    frontend_ip_configuration_name = http_listener.value.frontend_ip_configuration_name
    frontend_port_name             = http_listener.value.frontend_port_name
    protocol                       = "Http"
  }
}

  dynamic "request_routing_rule" {
    for_each = each.value.request_routing_rule
    content {
      name                       = request_routing_rule.value.request_routing_rule_name
      priority                   = 9
      rule_type                  = "Basic"
      http_listener_name         = request_routing_rule.value.http_listener_name
      backend_address_pool_name  = request_routing_rule.value.backend_address_pool_name
      backend_http_settings_name = request_routing_rule.value.backend_http_settings_name
    }

  }
}
