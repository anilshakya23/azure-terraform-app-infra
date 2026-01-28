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
    lb_name             = string
    location            = string
    resource_group_name = string
    ip_confi_name       = string
    lb_probe_name       = string
    backend_pool_name   = string
    pip-lb-data         = string
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
