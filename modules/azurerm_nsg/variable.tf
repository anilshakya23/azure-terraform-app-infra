variable "nsgs" {
  type = map(object({
    nsg_name             = string
    location             = string
    resource_group_name  = string
    subnet-nsg-data      = string
    virtual_network_name = string
  }))
}
