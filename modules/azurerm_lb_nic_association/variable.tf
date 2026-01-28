variable "lb_association" {
  type = map(object({
    ip_configuration_name = string
    lb_data_nama          = string
    lb_backend_name       = string
    nic_data_name         = string
    resource_group_name   = string
  }))
}