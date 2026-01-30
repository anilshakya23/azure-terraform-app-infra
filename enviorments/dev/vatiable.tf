variable "rgs" {
  type = map(object({
    rg_name  = string
    location = string
  }))

}

variable "pips" {
  type = map(object({
    pip_name            = string
    resource_group_name = string
    location            = string
    allocation_method   = string
  }))

}

variable "networks" {
  type = map(object({
    vnet_name           = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    subnets = map(object({
      subnet_name      = string
      address_prefixes = list(string)
    }))
  }))
}


variable "vms" {
  type = map(object({
    nic_name             = string
    location             = string
    resource_group_name  = string
    vm_name              = string
    size                 = string
    virtual_network_name = string
    admin_username       = string
    admin_password       = string
    subnet-vm-data       = string
    script_name          = string
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))

}


variable "sql_database" {
  type = map(object({
    sql_name                     = string
    resource_group_name          = string
    location                     = string
    db_name                      = string
    collation                    = string
    license_type                 = string
    administrator_login          = string
    administrator_login_password = string
  }))

}
variable "lbs" {
  type = map(object({
    lb_name              = string
    location             = string
    resource_group_name  = string
    ip_confi_name        = string
    lb_probe_name        = string
    backend_pool_name    = string
    subnet-lb-data       = string
    virtual_network_name = string
    frontend_ip_configuration = object({
      frontend_ip_name = string
    })
  }))
}

variable "lb_association" {
  type = map(object({
    ip_configuration_name = string
    lb_data_nama          = string
    lb_backend_name       = string
    nic_data_name         = string
    resource_group_name   = string
  }))
}

variable "nsgs" {
  type = map(object({
    nsg_name             = string
    location             = string
    resource_group_name  = string
    subnet-nsg-data      = string
    virtual_network_name = string
  }))
}

variable "bastion" {
  type = map(object({
    bastion_name         = string
    location             = string
    resource_group_name  = string
    pip-bastion-data     = string
    subnet-bastion-data  = string
    virtual_network_name = string
  }))
}

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

variable "appgateway_nic" {
  type = map(object({
    ip_configuration_name  = string
    nic_data_name          = string
    resource_group_name    = string
    backend_pool_data_name = string
  }))
}
