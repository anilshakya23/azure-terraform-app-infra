variable "appgateways" {
  type = map(object({
    appgateways_name        = string
    resource_group_name     = string
    location                = string
    subnet-appgateways-data = string
    pip-appgateways-data    = string
    virtual_network_name = string
    gateway_ip_configuration = object({
      gateway_name = string
    })
    frontend_port = map(object({
      frontend_port_name = string
    }))
    frontend_ip_configuration = map(object({
      frontend_ip_configuration_name = string
    }))
    backend_address_pool_name = map(object({
      backend_address_pool_name = string
    }))
    backend_http_settings = map(object({
      backend_http_settings_name = string
    }))
    http_listener = map(object({
      http_listener_name             = string
      frontend_ip_configuration_name = string
      frontend_port_name             = string
    }))
    request_routing_rule = map(object({
      request_routing_rule_name  = string
      http_listener_name         = string
      backend_address_pool_name  = string
      backend_http_settings_name = string
    }))
  }))
}


