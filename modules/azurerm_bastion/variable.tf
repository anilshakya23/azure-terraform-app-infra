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