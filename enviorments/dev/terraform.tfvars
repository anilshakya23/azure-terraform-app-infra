rgs = {
  rg1 = {
    rg_name  = "rg-dev-001"
    location = "South Africa North"
  }
}

pips = {
  pip1 = {
    pip_name            = "pip-lb-dev-001"
    resource_group_name = "rg-dev-001"
    location            = "South Africa North"
    allocation_method   = "Static"

  }
    pip2 = {
    pip_name            = "pip-bastion-dev-001"
    resource_group_name = "rg-dev-001"
    location            = "South Africa North"
    allocation_method   = "Static"

  }
}

networks = {
  Vnet1 = {
    vnet_name           = "vnet-dev-001"
    location            = "South Africa North"
    resource_group_name = "rg-dev-001"
    address_space       = ["10.0.0.0/16"]
    subnets = {
      subnet1 = {
        subnet_name      = "subnet-frontend-dev-001"
        address_prefixes = ["10.0.1.0/24"]
      },
      subnet2 = {
        subnet_name      = "subnet-backend-dev-001"
        address_prefixes = ["10.0.2.0/24"]
      },
      subnet3 = {
        subnet_name      = "AzureBastionSubnet"
        address_prefixes = ["10.0.3.0/24"]
      },

    }
  }
}

vms = {
  vm1 = {
    nic_name              = "nic-frontend-dev-001"
    location              = "South Africa North"
    resource_group_name   = "rg-dev-001"
    vm_name               = "vm-frontend-dev-001"
    size                  = "Standard_D2s_v3"
    admin_username        = "Nemuadmin"
    admin_password        = "Nemuuser@1234"
    subnet-vm-data        = "subnet-frontend-dev-001"
    virtual_network_name  = "vnet-dev-001"
    ip_configuration_name = "PublicIPAddress"
    lb_data_nama          = "lb-dev-001"
    lb_backend_name       = "lb-backend_pool"
    script_name           = "starbucks.sh"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
  vm2 = {
    nic_name              = "nic-backend-dev-001"
    location              = "South Africa North"
    resource_group_name   = "rg-dev-001"
    vm_name               = "vm-backend-dev-001"
    size                  = "Standard_D2s_v3"
    admin_username        = "Nemuadmin"
    admin_password        = "Nemuuser@12345"
    subnet-vm-data        = "subnet-backend-dev-001"
    virtual_network_name  = "vnet-dev-001"
    ip_configuration_name = "PublicIPAddress"
    lb_data_nama          = "lb-dev-001"
    lb_backend_name       = "lb-backend-pool"
    script_name           = "stremflix.sh"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }

}

nsgs = {
  nsg1 = {
    nsg_name             = "nsg-frontend-dev-001"
    location             = "South Africa North"
    resource_group_name  = "rg-dev-001"
    subnet-nsg-data      = "subnet-frontend-dev-001"
    virtual_network_name = "vnet-dev-001"
  }
  nsg2 = {
    nsg_name             = "nsg-backend-dev-001"
    location             = "South Africa North"
    resource_group_name  = "rg-dev-001"
    subnet-nsg-data      = "subnet-backend-dev-001"
    virtual_network_name = "vnet-dev-001"
  }
}

sql_database = {
  sql1 = {
    sql_name                     = "sql-dev-evoanl143-001"
    resource_group_name          = "rg-dev-001"
    location                     = "South Africa North"
    db_name                      = "sql_data-dev-001"
    collation                    = "SQL_Latin1_General_CP1_CI_AS"
    license_type                 = "LicenseIncluded"
    administrator_login          = "Nemuadmin"
    administrator_login_password = "Nemuuser#9718"

  }
}

lbs = {
  lb1 = {
    lb_name             = "lb-dev-001"
    location            = "South Africa North"
    resource_group_name = "rg-dev-001"
    ip_confi_name       = "PublicIPAddress"
    lb_probe_name       = "lb-lb_probe_name"
    backend_pool_name   = "lb-backend-pool"
    pip-lb-data         = "pip-lb-dev-001"
    frontend_ip_configuration = {
      frontend_ip_name = "PublicIPAddress"
    }
  }
}


lb_association = {
  lb_association1 = {
    ip_configuration_name = "internal"
    lb_data_nama          = "lb-dev-001"
    lb_backend_name       = "lb-backend-pool"
    nic_data_name         = "nic-frontend-dev-001"
    resource_group_name   = "rg-dev-001"
  }
  lb_association2 = {
    ip_configuration_name = "internal"
    lb_data_nama          = "lb-dev-001"
    lb_backend_name       = "lb-backend-pool"
    nic_data_name         = "nic-backend-dev-001"
    resource_group_name   = "rg-dev-001"
  }
}

bastion = {
  bastion = {
    bastion_name         = "bastion-dev-001"
    location             = "South Africa North"
    resource_group_name  = "rg-dev-001"
    pip-bastion-data     = "pip-bastion-dev-001"
    subnet-bastion-data  = "AzureBastionSubnet"
    virtual_network_name = "vnet-dev-001"
  }
}
