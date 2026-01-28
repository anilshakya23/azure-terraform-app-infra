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
